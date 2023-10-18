import 'package:clean_flutter_template/shared/domain/entities/user.dart';
import '../../../../../../../shared/helpers/errors/errors.dart';

abstract class CreateUserState {}

class StartCreateState implements CreateUserState {
  const StartCreateState();
}

class LoadingCreateState implements CreateUserState {
  const LoadingCreateState();
}

class ErrorCreateState implements CreateUserState {
  final Failure error;
  const ErrorCreateState(this.error);
}

class SuccessCreateState implements CreateUserState {
  final User user;
  const SuccessCreateState(this.user);
}
