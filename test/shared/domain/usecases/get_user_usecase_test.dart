import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/domain/repositories/user_repository_interface.dart';
import 'package:clean_flutter_template/shared/domain/usecases/get_user_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class UserRepositoryMockSuccess extends Mock implements IUserRepository {
  @override
  Future<Either<Failure, UserModel>> getUser(int id) async {
    var user = UserModel(
      id: 0,
      name: 'Vitor Soller',
      email: 'gabriel.godoybz@hotmail.com',
      state: StateEnum.APPROVED,
    );
    return right(user);
  }
}

class UserRepositoryMockFailed extends Mock implements IUserRepository {
  @override
  Future<Either<Failure, UserModel>> getUser(int id) async {
    return left(ErrorRequest(message: ''));
  }
}

void main() {
  late GetUserUsecase usecase;
  IUserRepository repositorySuccess = UserRepositoryMockSuccess();
  IUserRepository repositoryFailed = UserRepositoryMockFailed();

  setUpAll(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - GetUserUsecase', () {
    test('should return an User', () async {
      usecase = GetUserUsecase(repositorySuccess);
      final result = await usecase(0);

      expect(result.fold(id, id), isA<UserModel>());
    });

    test('should return an ErrorRequest', () async {
      usecase = GetUserUsecase(repositoryFailed);
      final result = await usecase(0);

      expect(result.fold(id, id), isA<ErrorRequest>());
    });
  });
}
