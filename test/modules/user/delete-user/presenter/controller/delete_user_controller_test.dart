import 'package:clean_flutter_template/app/modules/user/delete-user/presenter/controller/delete_user_controller.dart';
import 'package:clean_flutter_template/app/modules/user/delete-user/presenter/ui/states/delete_user_state.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/domain/usecases/delete_user_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'delete_user_controller_test.mocks.dart';

@GenerateMocks([DeleteUserUsecase])
void main() {
  late DeleteUserController controller;
  DeleteUserUsecase usecase = MockDeleteUserUsecase();

  setUp(() async {
    controller = DeleteUserController(usecase);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - deleteUser', () {
    var userModel = UserModel(
      name: 'Gabriel',
      email: 'gabriel.godoybz@hotmail.com',
      state: StateEnum.REJECTED,
      id: 0,
    );

    test('should return SuccessDeleteState', () async {
      when(usecase.call(0)).thenAnswer((_) async => Right(userModel));
      expect(controller.state, const StartDeleteState());
      controller.setUserId(0);
      await controller.deleteUser();
      expect(controller.state, isA<SuccessDeleteState>());
    });

    test('should return ErrorDeleteState', () async {
      when(usecase.call(0))
          .thenAnswer((_) async => left(ErrorRequest(message: 'message')));
      expect(controller.state, const StartDeleteState());
      controller.setUserId(0);
      await controller.deleteUser();
      expect(controller.state, isA<ErrorDeleteState>());
    });

    test('[TEST] - setUserId', () {
      controller.setUserId(123);
      expect(controller.userId, 123);
    });

    test('[TEST] - setPageState', () {
      controller.setPageState(const StartDeleteState());
      expect(controller.state, const StartDeleteState());
    });
  });
}
