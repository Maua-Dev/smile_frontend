import 'package:smile_frontend/app/modules/adm/infra/models/activity_admin_model.dart';

abstract class ActivityAdminRepositoryInterface {
  Future<List<ActivityAdminModel>> getAllAdminActivities();
  Future<bool> createActivity(ActivityAdminModel activityToCreate);
}
