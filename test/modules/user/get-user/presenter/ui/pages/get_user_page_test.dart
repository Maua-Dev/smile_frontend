import 'package:clean_flutter_template/app/modules/user/get-user/get_user_module.dart';
import 'package:clean_flutter_template/app/modules/user/get-user/presenter/controller/get_user_controller.dart';
import 'package:clean_flutter_template/app/modules/user/get-user/presenter/ui/pages/get_user_page.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/domain/usecases/get_user_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:clean_flutter_template/shared/widgets/footer_widget.dart';
import 'package:clean_flutter_template/shared/widgets/logo_widget.dart';
import 'package:clean_flutter_template/shared/widgets/text_field_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;

import '../../controller/get_user_controller_test.mocks.dart';

@GenerateMocks([GetUserUsecase])
void main() {
  late GetUserController controller;
  GetUserUsecase usecase = MockGetUserUsecase();

  String name = "Gabriel Godoy";
  String email = "gabriel.godoybz@hotmail.com";

  setUp(() async {
    initModules([
      GetUserModule()
    ], replaceBinds: [
      modular.Bind<IGetUserUsecase>((i) => usecase),
    ]);
    controller = Modular.get<GetUserController>();
    usecase = Modular.get<GetUserUsecase>();
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  testWidgets('[TEST] - GetUserPage must show some widgets when initialize',
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const GetUserPage()));
    expect(find.byType(LogoWidget), findsOneWidget);
    expect(find.text(S.current.getPageTitle), findsOneWidget);
    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(TextFieldWidget), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text(S.current.searchTitle), findsOneWidget);
    expect(find.byType(Spacer), findsOneWidget);
    expect(find.byType(FooterWidget), findsOneWidget);
  });

  testWidgets('[TEST] - GetUserPage must show SuccessWidget when create user',
      (widgetTester) async {
    var userModel = UserModel(
      name: name,
      email: email,
      state: StateEnum.REJECTED,
      id: 0,
    );
    await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const GetUserPage()));
    when(usecase.call(0)).thenAnswer((_) async => Right(userModel));
    await widgetTester.runAsync(() async => controller.setUserId(0));
    await widgetTester.runAsync(() async => controller.getUser());
    await widgetTester.pump();

    expect(find.text('Nome: ${userModel.name}'), findsOneWidget);
    expect(find.text('Email: ${userModel.email}'), findsOneWidget);
    expect(find.text('State: REJECTED'), findsOneWidget);
  });

  testWidgets('[TEST] - GetUserPage must show ErrorWidget when create user',
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const GetUserPage()));
    when(usecase.call(10000))
        .thenAnswer((_) async => left(ErrorRequest(message: 'message')));
    await widgetTester.runAsync(() async => controller.setUserId(10000));

    await widgetTester.runAsync(() async => controller.getUser());
    await widgetTester.pump();

    expect(find.text(S.current.requestErrorMessage('', 'message')),
        findsOneWidget);
  });
}
