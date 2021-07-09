import 'package:epilepsy/api/api_service.dart';
import 'package:epilepsy/models/seizure_model.dart';
import 'package:epilepsy/models/seizure_type.dart';
import 'package:get/get.dart';

class SeizureActivitiesController extends GetxController {
  var isLoading = false.obs;
  var seizureActivityList = <SeizureModel>[].obs;

  void fetchSeizureActivity() async {
    try {
      isLoading(true);
      var fetchSeizureActivities = await ApiService.fetchSeizureActivities();
      if (fetchSeizureActivities != null) {
        seizureActivityList.assignAll(fetchSeizureActivities.seizureTypeModel);
      }
    } finally {
      isLoading(false);
    }
  }
}
