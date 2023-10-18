import 'package:clean_flutter_template/app/modules/user/create-user/create_user_module.dart';
import 'package:clean_flutter_template/app/modules/user/create-user/presenter/controller/create_user_controller.dart';
import 'package:clean_flutter_template/app/modules/user/create-user/presenter/ui/pages/create_user_page.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/domain/usecases/create_user_usecase.dart';
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

import '../../controller/create_user_controller_test.mocks.dart';

@GenerateMocks([CreateUserUsecase])
void main() {
  late CreateUserController controller;
  CreateUserUsecase usecase = MockCreateUserUsecase();

  String name = "Gabriel Godoy";
  String email = "gabriel.godoybz@hotmail.com";

  setUp(() async {
    initModules([
      CreateUserModule()
    ], replaceBinds: [
      modular.Bind<ICreateUserUsecase>((i) => usecase),
    ]);
    controller = Modular.get<CreateUserController>();
    usecase = Modular.get<CreateUserUsecase>();
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  testWidgets('[TEST] - CreateUserPage must show some widgets when initialize',
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const CreateUserPage()));
    expect(find.byType(LogoWidget), findsOneWidget);
    expect(find.text(S.current.createPageTitle), findsOneWidget);
    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(TextFieldWidget), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text(S.current.registerTitle), findsOneWidget);
    expect(find.byType(Spacer), findsOneWidget);
    expect(find.byType(FooterWidget), findsOneWidget);
  });

  testWidgets(
      '[TEST] - CreateUserPage must show SuccessWidget when create user',
      (widgetTester) async {
    var userModel = UserModel(
      name: name,
      email: email,
      state: StateEnum.REJECTED,
    );
    await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const CreateUserPage()));
    when(usecase.call(name, email)).thenAnswer((_) async => Right(userModel));
    await widgetTester.runAsync(() async => controller.setUserEmail(email));
    await widgetTester.runAsync(() async => controller.setUserName(name));
    await widgetTester.runAsync(() async => controller.createUser());
    await widgetTester.pump();

    expect(find.text(S.current.successCreateUser('', name)), findsOneWidget);
  });

  testWidgets('[TEST] - CreateUserPage must show ErrorWidget when create user',
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const CreateUserPage()));
    when(usecase.call(name, email))
        .thenAnswer((_) async => left(ErrorRequest(message: 'message')));
    await widgetTester.runAsync(() async => controller.setUserEmail(email));
    await widgetTester.runAsync(() async => controller.setUserName(name));
    await widgetTester.runAsync(() async => controller.createUser());
    await widgetTester.pump();

    expect(find.text(S.current.requestErrorMessage('', 'message')),
        findsOneWidget);
  });
}
