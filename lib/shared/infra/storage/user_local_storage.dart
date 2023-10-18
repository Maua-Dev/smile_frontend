import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/enums/state_enum.dart';
import '../../domain/storage/user_local_storage_interface.dart';

class UserLocalStorage implements IUserLocalStorage {
  final Box storage;

  UserLocalStorage._(this.storage);

  static Future<UserLocalStorage> instance() async {
    await Hive.initFlutter();
    return UserLocalStorage._(await Hive.openBox('user'));
  }

  @override
  Future<void> createUser(UserModel user) async {
    await storage.put(user.id, {
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'state': user.state.name,
    });
  }

  @override
  Future<UserModel?> getUser(int id) async {
    var user = await storage.get(id);
    if (user != null) {
      return UserModel(
        id: user['id'],
        name: user['name'],
        email: user['email'],
        state: StateEnum.values
            .firstWhere((element) => element.name == user['state']),
      );
    }
    return null;
  }

  @override
  Future<void> deleteUser(int id) async {
    await storage.delete(id);
  }

  @override
  Future<void> updateUser(UserModel user) async {
    await storage.delete(user.id);
    await storage.put(user.id, {
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'state': user.state.name,
    });
  }
}
