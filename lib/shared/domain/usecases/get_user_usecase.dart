import 'package:dartz/dartz.dart';

import '../../helpers/errors/errors.dart';
import '../entities/user.dart';
import '../repositories/user_repository_interface.dart';

abstract class IGetUserUsecase {
  Future<Either<Failure, User>> call(int id);
}

class GetUserUsecase implements IGetUserUsecase {
  final IUserRepository repository;

  GetUserUsecase(this.repository);

  @override
  Future<Either<Failure, User>> call(int id) async {
    return await repository.getUser(id);
  }
}
