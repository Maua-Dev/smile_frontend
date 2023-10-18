import 'package:clean_flutter_template/shared/infra/external/http/user_datasource_interface.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import '../../../helpers/services/http_service.dart';

class UserDatasource implements IUserDatasource {
  final HttpService _httpService;

  UserDatasource(this._httpService);

  @override
  Future<UserModel> deleteUser(String userId) async {
    var response = await _httpService.post(
      '/delete-user',
      data: {
        'user_id': userId,
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<UserModel> getUser(String userId) async {
    var response = await _httpService.get('/get-user?user_id=$userId');

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<UserModel> updateUser(UserModel userToUpdate) async {
    var response = await _httpService.post(
      '/update-user',
      data: userToUpdate.toJsonUpdate(),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<UserModel> createUser(UserModel userToCreate) async {
    var response = await _httpService.post(
      '/create-user',
      data: userToCreate.toJsonCreate(),
    );

    if (response.statusCode == 201) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}
