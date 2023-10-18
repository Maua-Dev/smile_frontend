import 'package:clean_flutter_template/app/modules/user/delete-user/presenter/controller/delete_user_controller.dart';
import 'package:clean_flutter_template/app/modules/user/delete-user/presenter/ui/pages/delete_user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/domain/repositories/user_repository_interface.dart';
import '../../../../shared/domain/usecases/delete_user_usecase.dart';
import '../user_module.dart';

class DeleteUserModule extends Module {
  @override
  List<Module> get imports => [UserModule()];

  @override
  List<Bind> get binds => [
        Bind<IDeleteUserUsecase>(
            (i) => DeleteUserUsecase(i<IUserRepository>())),
        Bind<DeleteUserController>(
            (i) => DeleteUserController(i<IDeleteUserUsecase>())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const DeleteUserPage(),
        ),
      ];
}
