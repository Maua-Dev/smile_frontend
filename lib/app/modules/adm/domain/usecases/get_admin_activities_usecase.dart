import 'package:smile_frontend/app/modules/adm/domain/entities/activity_admin.dart';
import 'package:smile_frontend/app/shared/domain/repositories/activities_repository_interface.dart';

abstract class GetAdminActivitiesUsecaseInterface {
  Future<List<ActivityAdmin>> call();
}

class GetAdminActivitiesUsecase implements GetAdminActivitiesUsecaseInterface {
  final ActivitiesRepositoryInterface repository;

  GetAdminActivitiesUsecase({required this.repository});

  @override
  Future<List<ActivityAdmin>> call() async {
    return await repository.getAllAdminActivities();
  }
}
