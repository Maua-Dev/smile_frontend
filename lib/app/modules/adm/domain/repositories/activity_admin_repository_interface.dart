import 'package:smile_frontend/app/modules/adm/domain/entities/activity_admin.dart';

abstract class ActivityAdminRepositoryInterface {
  Future<List<ActivityAdmin>> getAllAdminActivities();
}
