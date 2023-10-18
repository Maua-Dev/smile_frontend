import 'package:clean_flutter_template/shared/domain/storage/local_storage_interface.dart';
import 'package:clean_flutter_template/shared/helpers/services/http_request_interface.dart';
import 'package:clean_flutter_template/shared/helpers/services/http_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'http_service_test.mocks.dart';

@GenerateMocks([ILocalStorage, IHttpRequest])
void main() {
  ILocalStorage storage = MockILocalStorage();
  IHttpRequest httpRequest = MockIHttpRequest();
  late HttpService httpService;

  setUp(() async {
    httpService = HttpService(storage: storage, httpRequest: httpRequest);
  });

  group('[TEST] - get', () {
    test('should return Success 200', () async {
      final userData = {
        'user_id': 123,
        'name': 'John Doe',
        'email': 'johndoe@example.com',
        'state': 'APPROVED'
      };
      final response = Response(
          data: userData, statusCode: 200, requestOptions: RequestOptions());
      when(httpRequest.get('url')).thenAnswer((_) async => response);
      var res = await httpService.get('url');
      expect(res.statusCode, 200);
    });

    test('should return error 500', () async {
      final userData = {
        'user_id': 123,
        'name': 'John Doe',
        'email': 'johndoe@example.com',
        'state': 'APPROVED'
      };
      final response = Response(
          data: userData, statusCode: 500, requestOptions: RequestOptions());
      when(httpRequest.get('url')).thenAnswer((_) async => response);
      var res = await httpService.get('url');
      expect(res.statusCode, 500);
    });
  });

  group('[TEST] - post', () {
    test('should return Success 200', () async {
      final userData = {
        'user_id': 123,
        'name': 'John Doe',
        'email': 'johndoe@example.com',
        'state': 'APPROVED'
      };
      final response = Response(
          data: userData, statusCode: 200, requestOptions: RequestOptions());
      when(httpRequest.post('url', null)).thenAnswer((_) async => response);
      var res = await httpService.post('url');
      expect(res.statusCode, 200);
    });

    test('should return error 500', () async {
      final userData = {
        'user_id': 123,
        'name': 'John Doe',
        'email': 'johndoe@example.com',
        'state': 'APPROVED'
      };
      final response = Response(
          data: userData, statusCode: 500, requestOptions: RequestOptions());
      when(httpRequest.post('url', null)).thenAnswer((_) async => response);
      var res = await httpService.post('url');
      expect(res.statusCode, 500);
    });
  });

  group('[TEST] - put', () {
    test('should return Success 200', () async {
      final userData = {
        'user_id': 123,
        'name': 'John Doe',
        'email': 'johndoe@example.com',
        'state': 'APPROVED'
      };
      final response = Response(
          data: userData, statusCode: 200, requestOptions: RequestOptions());
      when(httpRequest.put('url', null)).thenAnswer((_) async => response);
      var res = await httpService.put('url');
      expect(res.statusCode, 200);
    });

    test('should return error 500', () async {
      final userData = {
        'user_id': 123,
        'name': 'John Doe',
        'email': 'johndoe@example.com',
        'state': 'APPROVED'
      };
      final response = Response(
          data: userData, statusCode: 500, requestOptions: RequestOptions());
      when(httpRequest.put('url', null)).thenAnswer((_) async => response);
      var res = await httpService.put('url');
      expect(res.statusCode, 500);
    });
  });
}
