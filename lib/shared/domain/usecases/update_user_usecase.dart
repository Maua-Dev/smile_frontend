import 'package:dartz/dartz.dart';

import '../../helpers/errors/errors.dart';
import '../../infra/models/user_model.dart';
import '../entities/user.dart';
import '../enums/state_enum.dart';
import '../repositories/user_repository_interface.dart';

abstract class IUpdateUserUsecase {
  Future<Either<Failure, User>> call(String name, String email, int id);
}

class UpdateUserUsecase implements IUpdateUserUsecase {
  final IUserRepository repository;

  UpdateUserUsecase(this.repository);

  @override
  Future<Either<Failure, User>> call(String name, String email, int id) async {
    UserModel userToUpdate = UserModel(
      email: email,
      name: name,
      state: StateEnum.REJECTED,
      id: id,
    );
    return await repository.updateUser(userToUpdate);
  }
}
