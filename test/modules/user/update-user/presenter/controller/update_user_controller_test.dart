import 'package:clean_flutter_template/app/modules/user/update-user/presenter/controller/update_user_controller.dart';
import 'package:clean_flutter_template/app/modules/user/update-user/presenter/ui/states/update_user_state.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/domain/usecases/update_user_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'update_user_controller_test.mocks.dart';

@GenerateMocks([UpdateUserUsecase])
void main() {
  late UpdateUserController controller;
  UpdateUserUsecase usecase = MockUpdateUserUsecase();

  setUp(() async {
    controller = UpdateUserController(usecase);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - updateUser', () {
    var userModel = UserModel(
      name: 'Gabriel',
      email: 'gabriel.godoybz@hotmail.com',
      state: StateEnum.REJECTED,
      id: 0,
    );

    test('should return SuccessUpdateState', () async {
      when(usecase.call('Gabriel', 'gabriel.godoybz@hotmail.com', 0))
          .thenAnswer((_) async => Right(userModel));
      expect(controller.state, const StartUpdateState());
      controller.setUserName(userModel.name);
      controller.setUserEmail(userModel.email);
      controller.setUserId(userModel.id!);
      await controller.updateUser();
      expect(controller.state, isA<SuccessUpdateState>());
    });

    test('should return ErrorUpdateState', () async {
      when(usecase.call('Gabriel', 'gabriel.godoybz@hotmail.com', 10000))
          .thenAnswer((_) async => left(ErrorRequest(message: 'message')));
      expect(controller.state, const StartUpdateState());
      controller.setUserName(userModel.name);
      controller.setUserEmail(userModel.email);
      controller.setUserId(10000);
      await controller.updateUser();
      expect(controller.state, isA<ErrorUpdateState>());
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

  test('[TEST] - setUserId', () {
    controller.setUserId(0);
    expect(controller.userId, 0);
  });

  test('[TEST] - setPageState', () {
    controller.setPageState(const StartUpdateState());
    expect(controller.state, const StartUpdateState());
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
