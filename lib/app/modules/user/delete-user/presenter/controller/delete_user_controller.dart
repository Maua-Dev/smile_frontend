import 'package:mobx/mobx.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../shared/domain/usecases/delete_user_usecase.dart';
import '../ui/states/delete_user_state.dart';

part 'delete_user_controller.g.dart';

class DeleteUserController = DeleteUserControllerBase
    with _$DeleteUserController;

abstract class DeleteUserControllerBase with Store {
  final IDeleteUserUsecase _deleteUserUsecase;

  DeleteUserControllerBase(this._deleteUserUsecase);

  @observable
  int? userId;

  @observable
  DeleteUserState state = const StartDeleteState();

  @action
  setUserId(int id) => userId = id;

  @action
  setPageState(DeleteUserState value) => state = value;

  @action
  String? validateUserId(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    } else if (int.tryParse(value) == null) {
      return S.current.fieldInvalidId;
    }
    return null;
  }

  @action
  Future<void> deleteUser() async {
    setPageState(const LoadingDeleteState());
    var result = await _deleteUserUsecase(userId!);
    setPageState(
        result.fold((l) => ErrorDeleteState(l), (r) => SuccessDeleteState(r)));
  }
}
