import '../../../../../../../shared/domain/entities/user.dart';
import '../../../../../../../shared/helpers/errors/errors.dart';

abstract class GetUserState {}

class StartGetState implements GetUserState {
  const StartGetState();
}

class LoadingGetState implements GetUserState {
  const LoadingGetState();
}

class ErrorGetState implements GetUserState {
  final Failure error;
  const ErrorGetState(this.error);
}

class SuccessGetState implements GetUserState {
  final User user;
  const SuccessGetState(this.user);
}
