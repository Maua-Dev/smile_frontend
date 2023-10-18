import 'package:clean_flutter_template/shared/domain/entities/user.dart';
import '../../../../../../../../shared/helpers/errors/errors.dart';

abstract class DeleteUserState {}

class StartDeleteState implements DeleteUserState {
  const StartDeleteState();
}

class LoadingDeleteState implements DeleteUserState {
  const LoadingDeleteState();
}

class ErrorDeleteState implements DeleteUserState {
  final Failure error;
  const ErrorDeleteState(this.error);
}

class SuccessDeleteState implements DeleteUserState {
  final User user;
  const SuccessDeleteState(this.user);
}
