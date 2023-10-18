import 'package:clean_flutter_template/shared/infra/storage/local_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/mockito.dart';

class MockBox extends Mock implements Box {}

void main() {
  LocalStorage localStorage;

  setUp(() async {
    await Hive.initFlutter();
    final mockBox = MockBox();
    when(mockBox.get('refreshToken')).thenAnswer((_) async => 'mock_token');
  });

  test('[TEST] - should return a token', () async {
    localStorage = await LocalStorage.instance();
    await localStorage.saveRefreshToken('mock_token');
    final token = await localStorage.getRefreshToken();
    expect(token, 'mock_token');
  });
}
