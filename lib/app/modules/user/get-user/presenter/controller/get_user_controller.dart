import 'package:mobx/mobx.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../shared/domain/usecases/get_user_usecase.dart';
import '../ui/states/get_user_state.dart';

part 'get_user_controller.g.dart';

class GetUserController = GetUserControllerBase with _$GetUserController;

abstract class GetUserControllerBase with Store {
  final IGetUserUsecase _getUserUsecase;

  GetUserControllerBase(this._getUserUsecase);

  @action
  Future<void> getUser() async {
    setPageState(const LoadingGetState());
    var result = await _getUserUsecase(userId!);
    setPageState(
        result.fold((l) => ErrorGetState(l), (r) => SuccessGetState(r)));
  }

  @observable
  int? userId;

  @observable
  GetUserState state = const StartGetState();

  @action
  setUserId(int id) => userId = id;

  @action
  setPageState(GetUserState value) => state = value;

  @action
  String? validateUserId(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    } else if (int.tryParse(value) == null) {
      return S.current.fieldInvalidId;
    }
    return null;
  }
}
