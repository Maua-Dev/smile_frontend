import 'package:clean_flutter_template/shared/domain/entities/user.dart';
import 'package:clean_flutter_template/shared/domain/repositories/user_repository_interface.dart';
import 'package:dartz/dartz.dart';

import '../../domain/enums/state_enum.dart';
import '../../helpers/errors/errors.dart';
import '../models/user_model.dart';

class UserRepositoryMock implements IUserRepository {
  List<User> users = [];

  UserRepositoryMock() {
    users = [
      User(
        id: 0,
        name: 'Gabriel Godoy',
        email: 'gabriel.godoybz@hotmail.com',
        state: StateEnum.APPROVED,
      ),
      User(
        id: 1,
        name: 'Vitor Soller',
        email: 'sollerzin@gmail.com',
        state: StateEnum.REJECTED,
      ),
    ];
  }

  @override
  Future<Either<Failure, User>> createUser(UserModel userToCreate) async {
    users.add(userToCreate);
    return right(userToCreate);
  }

  @override
  Future<Either<Failure, User>> deleteUser(int id) async {
    for (var i = 0; i < users.length; i++) {
      if (users[i].id == id) {
        users.removeAt(i);
        return right(users[i]);
      }
    }
    return left(NoItemsFound(message: "user_id"));
  }

  @override
  Future<Either<Failure, User>> getUser(int id) async {
    for (var user in users) {
      if (user.id == id) {
        return right(user);
      }
    }
    return left(NoItemsFound(message: "user_id"));
  }

  @override
  Future<Either<Failure, User>> updateUser(UserModel userToUpdate) async {
    for (var user in users) {
      if (user.id == userToUpdate.id) {
        user = userToUpdate;
        return right(user);
      }
    }
    return left(NoItemsFound(message: "user_id"));
  }
}
