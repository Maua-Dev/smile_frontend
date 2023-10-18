import 'package:clean_flutter_template/shared/infra/models/user_model.dart';

abstract class IUserDatasource {
  Future<UserModel> getUser(String userId);
  Future<UserModel> deleteUser(String userId);
  Future<UserModel> updateUser(UserModel userToUpdate);
  Future<UserModel> createUser(UserModel userToCreate);
}
