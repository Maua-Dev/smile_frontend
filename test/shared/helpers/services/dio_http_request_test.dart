import 'package:clean_flutter_template/shared/helpers/services/dio_http_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDio extends Mock implements Dio {
  @override
  BaseOptions get options => BaseOptions(baseUrl: 'https://example.com');

  @override
  Future<Response<T>> get<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) {
    final response =
        Response(statusCode: 200, requestOptions: RequestOptions());
    return Future.value(response) as Future<Response<T>>;
  }

  @override
  Future<Response<T>> post<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    final response =
        Response(statusCode: 200, requestOptions: RequestOptions());
    return Future.value(response) as Future<Response<T>>;
  }

  @override
  Future<Response<T>> put<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    final response =
        Response(statusCode: 200, requestOptions: RequestOptions());
    return Future.value(response) as Future<Response<T>>;
  }
}

void main() {
  var dio = MockDio();
  late DioHttpRequest httpRequest;

  setUpAll(
    () {
      httpRequest = DioHttpRequest(dio: dio);
    },
  );
  group('[TEST] - request', () {
    test('dio get', () async {
      var res = await httpRequest.get('/');
      expect(res.statusCode, 200);
    });

    test('dio post', () async {
      var res = await httpRequest.post('/', null);
      expect(res.statusCode, 200);
    });

    test('dio put', () async {
      var res = await httpRequest.put('/', null);
      expect(res.statusCode, 200);
    });
  });
}
