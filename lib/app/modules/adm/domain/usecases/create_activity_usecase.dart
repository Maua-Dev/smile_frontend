import 'package:smile_frontend/app/modules/adm/domain/repositories/activity_admin_repository_interface.dart';
import 'package:smile_frontend/app/modules/adm/infra/models/activity_admin_model.dart';

abstract class CreateActivityInterface {
  Future call(ActivityAdminModel activityToCreate);
}

class CreateActivityUsecase implements CreateActivityInterface {
  final ActivityAdminRepositoryInterface repository;

  CreateActivityUsecase({required this.repository});

  @override
  Future call(ActivityAdminModel activityToCreate) async {
    return await repository.createActivity(activityToCreate);
  }
}
