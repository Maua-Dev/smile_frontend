import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/domain/usecases/create_user_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../generated/l10n.dart';
import '../ui/states/create_user_state.dart';

part 'create_user_controller.g.dart';

class CreateUserController = CreateUserControllerBase
    with _$CreateUserController;

abstract class CreateUserControllerBase with Store {
  final ICreateUserUsecase _createUserUsecase;

  CreateUserControllerBase(this._createUserUsecase);

  @observable
  String userName = '';

  @observable
  String userEmail = '';

  @observable
  StateEnum userState = StateEnum.REJECTED;

  @observable
  String userId = '';

  @observable
  CreateUserState state = const StartCreateState();

  @action
  Future<void> createUser() async {
    setPageState(const LoadingCreateState());
    var result = await _createUserUsecase(userName, userEmail);
    setPageState(
        result.fold((l) => ErrorCreateState(l), (r) => SuccessCreateState(r)));
  }

  @action
  setUserName(String name) => userName = name;

  @action
  setUserEmail(String email) => userEmail = email;

  @action
  setPageState(CreateUserState value) => state = value;

  @action
  String? validateUserName(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    }
    return null;
  }

  @action
  String? validateUserEmail(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    } else if (!value.contains('@')) {
      return S.current.fieldInvalidEmail;
    }
    return null;
  }
}
