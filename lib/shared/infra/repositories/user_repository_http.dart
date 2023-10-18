import 'package:clean_flutter_template/shared/domain/entities/user.dart';
import 'package:clean_flutter_template/shared/infra/external/http/user_datasource_interface.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/repositories/user_repository_interface.dart';
import '../../domain/storage/user_local_storage_interface.dart';
import '../../helpers/enums/http_status_code_enum.dart';
import '../../helpers/errors/errors.dart';
import '../../helpers/functions/get_http_status_function.dart';
import '../models/user_model.dart';

class UserRepositoryHttp implements IUserRepository {
  final IUserDatasource datasource;
  final IUserLocalStorage storage;

  UserRepositoryHttp({required this.storage, required this.datasource});

  @override
  Future<Either<Failure, User>> createUser(UserModel userToCreate) async {
    UserModel user;
    try {
      user = await datasource.createUser(userToCreate);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
      //caso erro venha do back
      //return left(ErrorRequest(message: e.response?.data));
    }
    await storage.createUser(user);
    return right(user);
  }

  @override
  Future<Either<Failure, User>> deleteUser(int id) async {
    UserModel user;
    try {
      user = await datasource.deleteUser(id.toString());
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
      // caso erro venha do back
      // return left(ErrorRequest(message: e.response?.data));
    }
    await storage.deleteUser(user.id!);
    return right(user);
  }

  @override
  Future<Either<Failure, User>> getUser(int id) async {
    UserModel? user;
    try {
      user = await storage.getUser(id);
      user ??= await datasource.getUser(id.toString());
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
      //caso erro venha do back
      //return left(ErrorRequest(message: e.response?.data));
    }
    return right(user);
  }

  @override
  Future<Either<Failure, User>> updateUser(UserModel userToUpdate) async {
    UserModel user;
    try {
      user = await datasource.updateUser(userToUpdate);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
      //caso erro venha do back
      //return left(ErrorRequest(message: e.response?.data));
    }
    await storage.updateUser(user);
    return right(user);
  }
}
