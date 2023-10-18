import 'package:clean_flutter_template/app/modules/user/get-user/presenter/controller/get_user_controller.dart';
import 'package:clean_flutter_template/app/modules/user/get-user/presenter/ui/states/get_user_state.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/domain/usecases/get_user_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_user_controller_test.mocks.dart';

@GenerateMocks([GetUserUsecase])
void main() {
  late GetUserController controller;
  GetUserUsecase usecase = MockGetUserUsecase();
  var userModel = UserModel(
    name: 'Gabriel',
    email: 'gabriel.godoybz@hotmail.com',
    state: StateEnum.REJECTED,
    id: 0,
  );

  setUp(() async {
    controller = GetUserController(usecase);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - getUser', () {
    test('should return SuccessGetState', () async {
      when(usecase.call(0)).thenAnswer((_) async => Right(userModel));
      expect(controller.state, const StartGetState());
      controller.setUserId(0);
      await controller.getUser();
      expect(controller.state, isA<SuccessGetState>());
    });

    test('should return ErrorGetState', () async {
      when(usecase.call(100000))
          .thenAnswer((_) async => left(ErrorRequest(message: 'message')));
      expect(controller.state, const StartGetState());
      controller.setUserId(100000);
      await controller.getUser();
      expect(controller.state, isA<ErrorGetState>());
    });
  });

  test('[TEST] - setUserId', () {
    controller.setUserId(userModel.id!);
    expect(controller.userId, userModel.id);
  });

  test('[TEST] - setPageState', () {
    controller.setPageState(const LoadingGetState());
    expect(controller.state, isA<LoadingGetState>());
  });

  test('[TEST] - validateUserId', () {
    expect(controller.validateUserId(''), S.current.fieldRequired);
    expect(controller.validateUserId('0'), null);
  });
}
