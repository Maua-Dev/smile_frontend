import 'package:clean_flutter_template/shared/helpers/enums/http_status_code_enum.dart';
import 'package:clean_flutter_template/shared/helpers/functions/get_http_status_function.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('[TEST] - getHttpStatusFunction', () {
    test('NO_CONTENT', () {
      expect(getHttpStatusFunction(204), HttpStatusCodeEnum.NO_CONTENT);
    });
    test('REDIRECT', () {
      expect(getHttpStatusFunction(303), HttpStatusCodeEnum.REDIRECT);
    });
    test('BAD_REQUEST', () {
      expect(getHttpStatusFunction(400), HttpStatusCodeEnum.BAD_REQUEST);
    });
    test('UNAUTHORIZED', () {
      expect(getHttpStatusFunction(401), HttpStatusCodeEnum.UNAUTHORIZED);
    });
    test('FORBIDDEN', () {
      expect(getHttpStatusFunction(403), HttpStatusCodeEnum.FORBIDDEN);
    });
    test('NOT_FOUND', () {
      expect(getHttpStatusFunction(404), HttpStatusCodeEnum.NOT_FOUND);
    });
    test('METHOD_NOT_ALLOWED', () {
      expect(getHttpStatusFunction(405), HttpStatusCodeEnum.METHOD_NOT_ALLOWED);
    });
    test('CONFLICT', () {
      expect(getHttpStatusFunction(409), HttpStatusCodeEnum.CONFLICT);
    });
    test('INTERNAL_SERVER_ERROR', () {
      expect(
          getHttpStatusFunction(500), HttpStatusCodeEnum.INTERNAL_SERVER_ERROR);
    });
    test('BAD_GATEWAY', () {
      expect(getHttpStatusFunction(502), HttpStatusCodeEnum.BAD_GATEWAY);
    });
    test('SERVICE_UNAVAILABLE', () {
      expect(
          getHttpStatusFunction(503), HttpStatusCodeEnum.SERVICE_UNAVAILABLE);
    });
    test('GATEWAY_TIMEOUT', () {
      expect(getHttpStatusFunction(504), HttpStatusCodeEnum.GATEWAY_TIMEOUT);
    });
    test('UNKNOWN', () {
      expect(getHttpStatusFunction(0), HttpStatusCodeEnum.UNKNOWN);
    });
  });
}
