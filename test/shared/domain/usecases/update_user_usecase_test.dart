import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/entities/user.dart';
import 'package:clean_flutter_template/shared/domain/repositories/user_repository_interface.dart';
import 'package:clean_flutter_template/shared/domain/usecases/update_user_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class UserRepositoryMockSuccess extends Mock implements IUserRepository {
  @override
  Future<Either<Failure, UserModel>> updateUser(UserModel user) async {
    return right(user);
  }
}

class UserRepositoryMockFailed extends Mock implements IUserRepository {
  @override
  Future<Either<Failure, UserModel>> updateUser(User user) async {
    return left(ErrorRequest(message: ''));
  }
}

void main() {
  late UpdateUserUsecase usecase;
  IUserRepository repositorySuccess = UserRepositoryMockSuccess();
  IUserRepository repositoryFailed = UserRepositoryMockFailed();

  setUpAll(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - DeleteUserUsecase', () {
    test('should return an User', () async {
      usecase = UpdateUserUsecase(repositorySuccess);
      final result = await usecase('John Doe', 'johndoe@example.com', 0);

      expect(result.fold(id, id), isA<UserModel>());
    });

    test('should return an ErrorRequest', () async {
      usecase = UpdateUserUsecase(repositoryFailed);
      final result = await usecase('John Doe', 'johndoe@example.com', 0);

      expect(result.fold(id, id), isA<ErrorRequest>());
    });
  });
}
