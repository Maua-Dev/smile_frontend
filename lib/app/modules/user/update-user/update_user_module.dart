import 'package:clean_flutter_template/app/modules/user/update-user/presenter/controller/update_user_controller.dart';
import 'package:clean_flutter_template/app/modules/user/update-user/presenter/ui/pages/update_user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/domain/repositories/user_repository_interface.dart';
import '../../../../shared/domain/usecases/update_user_usecase.dart';
import '../user_module.dart';

class UpdateUserModule extends Module {
  @override
  List<Module> get imports => [UserModule()];

  @override
  List<Bind> get binds => [
        Bind<IUpdateUserUsecase>(
            (i) => UpdateUserUsecase(i<IUserRepository>())),
        Bind<UpdateUserController>(
            (i) => UpdateUserController(i<IUpdateUserUsecase>())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const UpdateUserPage(),
        ),
      ];
}
