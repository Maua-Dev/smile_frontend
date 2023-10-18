import 'dart:ui';

import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/datasource/external/http/user_datasource.dart';
import 'package:clean_flutter_template/shared/domain/entities/user.dart';
import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:clean_flutter_template/shared/infra/repositories/user_repository_http.dart';
import 'package:clean_flutter_template/shared/infra/storage/user_local_storage.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_repository_http_test.mocks.dart';

@GenerateMocks([UserDatasource, UserLocalStorage])
void main() {
  var user = UserModel(
    id: 0,
    name: 'Vitor Soller',
    email: 'gabriel.godoybz@hotmail.com',
    state: StateEnum.APPROVED,
  );

  var errorMessage = "Error";

  late UserRepositoryHttp repository;
  UserDatasource datasource = MockUserDatasource();
  UserLocalStorage storage = MockUserLocalStorage();

  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - createUser', () {
    repository = UserRepositoryHttp(datasource: datasource, storage: storage);
    test('should return a user', () async {
      when(datasource.createUser(user)).thenAnswer((_) async => user);
      var response = await repository.createUser(user);
      expect(response.fold(id, id), isA<User>());
    });

    test('should return ErrorRequest', () async {
      when(datasource.createUser(user)).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 400,
          data: {'message': errorMessage},
        ),
      ));
      var response = await repository.createUser(user);
      expect(response.fold(id, id), isA<ErrorRequest>());
    });
  });

  group('[TEST] - deleteUser', () {
    repository = UserRepositoryHttp(datasource: datasource, storage: storage);
    test('should return a user', () async {
      when(datasource.deleteUser('0')).thenAnswer((_) async => user);
      var response = await repository.deleteUser(0);
      expect(response.fold(id, id), isA<User>());
    });

    test('should return ErrorRequest', () async {
      when(datasource.deleteUser('0')).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 400,
          data: {'message': errorMessage},
        ),
      ));
      var response = await repository.deleteUser(0);
      expect(response.fold(id, id), isA<ErrorRequest>());
    });
  });

  group('[TEST] - getUser', () {
    repository = UserRepositoryHttp(datasource: datasource, storage: storage);
    test('should return a user in storage', () async {
      when(datasource.getUser('0')).thenAnswer((_) async => user);
      when(storage.getUser(0)).thenAnswer((_) async => user);
      var response = await repository.getUser(0);
      expect(response.fold(id, id), isA<User>());
    });

    test('should return a user datasource', () async {
      when(datasource.getUser('0')).thenAnswer((_) async => user);
      when(storage.getUser(0)).thenAnswer((_) async => null);
      var response = await repository.getUser(0);
      expect(response.fold(id, id), isA<User>());
    });

    test('should return ErrorRequest', () async {
      when(storage.getUser(0)).thenAnswer((_) async => null);
      when(datasource.getUser('0')).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 400,
          data: {'message': errorMessage},
        ),
      ));
      var response = await repository.getUser(0);
      expect(response.fold(id, id), isA<ErrorRequest>());
    });
  });

  group('[TEST] - updateUser', () {
    repository = UserRepositoryHttp(datasource: datasource, storage: storage);
    test('should return a user', () async {
      when(datasource.updateUser(user)).thenAnswer((_) async => user);
      var response = await repository.updateUser(user);
      expect(response.fold(id, id), isA<User>());
    });

    test('should return ErrorRequest', () async {
      when(datasource.updateUser(user)).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 400,
          data: {'message': errorMessage},
        ),
      ));
      var response = await repository.updateUser(user);
      expect(response.fold(id, id), isA<ErrorRequest>());
    });
  });
}
