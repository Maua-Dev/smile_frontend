import 'package:smile_frontend/app/modules/adm/infra/models/activity_admin_model.dart';

abstract class ActivityDatasourceInterface {
  Future<List<Map<String, dynamic>>> getAdminActivities();
  Future<ActivityAdminModel?> createActivity(ActivityAdminModel activity);
}
