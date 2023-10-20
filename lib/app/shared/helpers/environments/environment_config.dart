// // ignore_for_file: constant_identifier_names

// import 'package:smile_frontend/app/modules/user/user_module.dart';
// import 'package:smile_frontend/shared/infra/repositories/user_repository_mock.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import '../domain/repositories/user_repository_interface.dart';
// import '../helpers/enums/environment_enum.dart';
// import '../infra/external/http/user_datasource_interface.dart';
// import '../infra/repositories/user_repository_http.dart';
// import '../infra/storage/user_local_storage.dart';

// class EnvironmentConfig {
//   static const ENV = String.fromEnvironment(
//     'ENV',
//   );

//   static const MSS_USER_BASE_URL = String.fromEnvironment(
//     'MSS_USER_BASE_URL',
//   );

//   static IUserRepository getUserRepo() {
//     awaitModular();
//     EnvironmentEnum value = EnvironmentEnum.values.firstWhere(
//       (element) {
//         return element.name.toUpperCase() == ENV.toUpperCase();
//       },
//       orElse: () => EnvironmentEnum.DEV,
//     );
//     if (value == EnvironmentEnum.DEV) {
//       return UserRepositoryMock();
//     } else if (value == EnvironmentEnum.HOMOLOG) {
//       return UserRepositoryHttp(
//           datasource: Modular.get<IUserDatasource>(),
//           storage: Modular.get<UserLocalStorage>());
//     }
//     // else if (value == EnvironmentEnum.PROD) {
//     //   return null;
//     else {
//       return UserRepositoryMock();
//     }
//   }
// }

// Future awaitModular() async {
//   return await Modular.isModuleReady<UserModule>();
// }
