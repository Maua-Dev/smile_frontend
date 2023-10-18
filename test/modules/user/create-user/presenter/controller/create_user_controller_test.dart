import 'dart:ui';
import 'package:clean_flutter_template/app/modules/user/create-user/presenter/controller/create_user_controller.dart';
import 'package:clean_flutter_template/app/modules/user/create-user/presenter/ui/states/create_user_state.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/domain/usecases/create_user_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_user_controller_test.mocks.dart';

@GenerateMocks([CreateUserUsecase])
void main() {
  late CreateUserController controller;
  CreateUserUsecase usecase = MockCreateUserUsecase();

  setUp(() async {
    controller = CreateUserController(usecase);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - createUser', () {
    var userModel = UserModel(
      name: 'Gabriel',
      email: 'gabriel.godoybz@hotmail.com',
      state: StateEnum.REJECTED,
    );

    test('should return SuccessCreateState', () async {
      when(usecase.call('Gabriel', 'gabriel.godoybz@hotmail.com'))
          .thenAnswer((_) async => Right(userModel));
      expect(controller.state, const StartCreateState());
      controller.setUserName(userModel.name);
      controller.setUserEmail(userModel.email);
      await controller.createUser();
      expect(controller.state, isA<SuccessCreateState>());
    });

    test('should return ErrorCreateState', () async {
      when(usecase.call('Gabriel', 'gabriel.godoybz@hotmail.com'))
          .thenAnswer((_) async => left(ErrorRequest(message: 'message')));
      expect(controller.state, const StartCreateState());
      controller.setUserName(userModel.name);
      controller.setUserEmail(userModel.email);
      await controller.createUser();
      expect(controller.state, isA<ErrorCreateState>());
    });
  });

  test('[TEST] - setUserName', () {
    controller.setUserName('test');
    expect(controller.userName, 'test');
  });

  test('[TEST] - setUserEmail', () {
    controller.setUserEmail('test');
    expect(controller.userEmail, 'test');
  });

  test('[TEST] - setPageState', () {
    controller.setPageState(const StartCreateState());
    expect(controller.state, const StartCreateState());
  });

  test('[TEST] - validateUserName', () {
    expect(controller.validateUserName(''), S.current.fieldRequired);
    expect(controller.validateUserName('test'), null);
  });

  test('[TEST] - validateUserEmail', () {
    expect(controller.validateUserEmail(''), S.current.fieldRequired);
    expect(controller.validateUserEmail('test'), S.current.fieldInvalidEmail);
    expect(controller.validateUserEmail('test@'), null);
  });
}
