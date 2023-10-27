import 'package:smile_frontend/app/modules/adm/domain/repositories/activity_admin_repository_interface.dart';
import 'package:smile_frontend/app/modules/adm/infra/datasource/activity_datasource_interface.dart';
import 'package:smile_frontend/app/modules/adm/infra/models/activity_admin_model.dart';

class ActivityAdminRepository implements ActivityAdminRepositoryInterface {
  final ActivityDatasourceInterface datasource;

  ActivityAdminRepository({required this.datasource});

  List<ActivityAdminModel> listAllAdminActivity = [];

  @override
  Future<List<ActivityAdminModel>> getAllAdminActivities() async {
    if (listAllAdminActivity.isNotEmpty) {
      var result = await datasource.getAdminActivities();
      listAllAdminActivity =
          result.map((e) => ActivityAdminModel.fromJson(e)).toList();
    }
    return listAllAdminActivity;
  }

  @override
  Future<bool> createActivity(ActivityAdminModel activityToCreate) async {
    var response = await datasource.createActivity(activityToCreate);
    if (response != null) {
      listAllAdminActivity.insert(0, activityToCreate);
      return true;
    }
    return false;
  }
}
