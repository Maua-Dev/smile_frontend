import '../../../../../../../shared/domain/entities/user.dart';
import '../../../../../../../shared/helpers/errors/errors.dart';

abstract class UpdateUserState {}

class StartUpdateState implements UpdateUserState {
  const StartUpdateState();
}

class LoadingUpdateState implements UpdateUserState {
  const LoadingUpdateState();
}

class ErrorUpdateState implements UpdateUserState {
  final Failure error;
  const ErrorUpdateState(this.error);
}

class SuccessUpdateState implements UpdateUserState {
  final User user;
  const SuccessUpdateState(this.user);
}
