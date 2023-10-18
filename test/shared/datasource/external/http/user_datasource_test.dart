import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/datasource/external/http/user_datasource.dart';
import 'package:clean_flutter_template/shared/helpers/services/http_service.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_datasource_test.mocks.dart';

@GenerateMocks([HttpService])
void main() {
  late UserDatasource userDatasource;
  HttpService httpRequest = MockHttpService();

  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
    userDatasource = UserDatasource(httpRequest);
  });

  group('[TEST] - deleteUser', () {
    test('success 200', () async {
      var userId = '123';
      final userData = {
        'user_id': 123,
        'name': 'John Doe',
        'email': 'johndoe@example.com',
        'state': 'APPROVED'
      };
      final response = Response(
          data: userData, statusCode: 200, requestOptions: RequestOptions());

      when(httpRequest.post(
        '/delete-user',
        data: {
          'user_id': userId,
        },
      )).thenAnswer((_) async => response);

      final result = await userDatasource.deleteUser(userId);

      expect(result.id, 123);
    });

    test('failure', () async {
      var userId = '123';
      final response =
          Response(statusCode: 500, requestOptions: RequestOptions());

      when(httpRequest.post(
        '/delete-user',
        data: {
          'user_id': userId,
        },
      )).thenAnswer((_) async => response);

      expect(() => userDatasource.deleteUser(userId), throwsException);
    });
  });

  group('[TEST] - getUser', () {
    test('success 200', () async {
      var userId = '123';
      final userData = {
        'user_id': 123,
        'name': 'John Doe',
        'email': 'johndoe@example.com',
        'state': 'APPROVED'
      };
      final response = Response(
          data: userData, statusCode: 200, requestOptions: RequestOptions());

      when(httpRequest.get('/get-user?user_id=$userId'))
          .thenAnswer((_) async => response);

      final result = await userDatasource.getUser(userId);

      expect(result.id, 123);
    });

    test('failure', () async {
      var userId = '123';
      final response =
          Response(statusCode: 500, requestOptions: RequestOptions());

      when(httpRequest.get('/get-user?user_id=$userId'))
          .thenAnswer((_) async => response);

      expect(() => userDatasource.getUser(userId), throwsException);
    });
  });

  group('[TEST] - createUser', () {
    test('success 201', () async {
      final userData = {
        'user_id': 123,
        'name': 'John Doe',
        'email': 'johndoe@example.com',
        'state': 'APPROVED'
      };
      final response = Response(
          data: userData, statusCode: 201, requestOptions: RequestOptions());

      when(httpRequest.post(
        '/create-user',
        data: {
          'name': 'John Doe',
          'email': 'johndoe@example.com',
        },
      )).thenAnswer((_) async => response);

      final result =
          await userDatasource.createUser(UserModel.fromJson(userData));

      expect(result.id, 123);
    });

    test('failure', () async {
      final userData = {
        'user_id': 123,
        'name': 'John Doe',
        'email': 'johndoe@example.com',
        'state': 'APPROVED'
      };
      final response =
          Response(statusCode: 500, requestOptions: RequestOptions());

      when(httpRequest.post(
        '/create-user',
        data: {
          'name': 'John Doe',
          'email': 'johndoe@example.com',
        },
      )).thenAnswer((_) async => response);

      expect(() => userDatasource.createUser(UserModel.fromJson(userData)),
          throwsException);
    });
  });

  group('[TEST] - updateUser', () {
    test('success 200', () async {
      final userData = {
        'user_id': 123,
        'name': 'John Doe',
        'email': 'johndoe@example.com',
        'state': 'APPROVED'
      };
      final response = Response(
          data: userData, statusCode: 200, requestOptions: RequestOptions());

      when(httpRequest.post(
        '/update-user',
        data: {
          'user_id': '123',
          'new_name': 'John Doe',
        },
      )).thenAnswer((_) async => response);

      final result =
          await userDatasource.updateUser(UserModel.fromJson(userData));

      expect(result.id, 123);
    });

    test('failure', () async {
      final userData = {
        'user_id': 123,
        'name': 'John Doe',
        'email': 'johndoe@example.com',
        'state': 'APPROVED'
      };
      final response =
          Response(statusCode: 500, requestOptions: RequestOptions());

      when(httpRequest.post(
        '/update-user',
        data: {
          'user_id': '123',
          'new_name': 'John Doe',
        },
      )).thenAnswer((_) async => response);

      expect(() => userDatasource.updateUser(UserModel.fromJson(userData)),
          throwsException);
    });
  });
}
