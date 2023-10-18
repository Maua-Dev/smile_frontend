import 'package:clean_flutter_template/app/modules/user/create-user/presenter/controller/create_user_controller.dart';
import 'package:clean_flutter_template/app/modules/user/create-user/presenter/ui/pages/create_user_page.dart';
import 'package:clean_flutter_template/shared/domain/usecases/create_user_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../shared/domain/repositories/user_repository_interface.dart';
import '../user_module.dart';

class CreateUserModule extends Module {
  @override
  List<Module> get imports => [UserModule()];

  @override
  List<Bind> get binds => [
        Bind<ICreateUserUsecase>(
            (i) => CreateUserUsecase(i<IUserRepository>())),
        Bind<CreateUserController>(
            (i) => CreateUserController(i<ICreateUserUsecase>())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const CreateUserPage(),
        ),
      ];
}
