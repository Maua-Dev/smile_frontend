import '../../infra/models/user_model.dart';

abstract class IUserLocalStorage {
  Future<void> createUser(UserModel user);
  Future<UserModel?> getUser(int id);
  Future<void> updateUser(UserModel user);
  Future<void> deleteUser(int id);
}
