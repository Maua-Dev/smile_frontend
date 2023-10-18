import 'package:clean_flutter_template/app/modules/user/get-user/presenter/controller/get_user_controller.dart';
import 'package:clean_flutter_template/app/modules/user/get-user/presenter/ui/pages/get_user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/domain/repositories/user_repository_interface.dart';
import '../../../../shared/domain/usecases/get_user_usecase.dart';
import '../user_module.dart';

class GetUserModule extends Module {
  @override
  List<Module> get imports => [UserModule()];

  @override
  List<Bind> get binds => [
        Bind<IGetUserUsecase>((i) => GetUserUsecase(i<IUserRepository>())),
        Bind<GetUserController>((i) => GetUserController(i<IGetUserUsecase>())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const GetUserPage(),
        ),
      ];
}
