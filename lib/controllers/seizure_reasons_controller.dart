import 'package:epilepsy/api/api_service.dart';
import 'package:epilepsy/models/seizure_model.dart';
import 'package:epilepsy/models/seizure_type.dart';
import 'package:get/get.dart';

class SeizureReasonsController extends GetxController {
  var isLoading = false.obs;
  var seizureReasonList = <SeizureModel>[].obs;

  void fetchSeizureReason() async {
    try {
      isLoading(true);
      var fetchReasonType = await ApiService.fetchSeizureReasons();
      if (fetchReasonType != null) {
        seizureReasonList.assignAll(fetchReasonType.seizureTypeModel);
      }
    } finally {
      isLoading(false);
    }
  }
}
