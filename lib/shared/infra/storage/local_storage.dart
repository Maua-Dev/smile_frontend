import 'package:clean_flutter_template/shared/domain/storage/local_storage_interface.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage implements ILocalStorage {
  final Box storage;

  LocalStorage._(this.storage);

  static Future<LocalStorage> instance() async {
    await Hive.initFlutter();
    return LocalStorage._(await Hive.openBox('box'));
  }

  @override
  Future<String> getRefreshToken() async {
    return await storage.get('refreshToken');
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await storage.put('refreshToken', token);
  }
}
