import 'package:epilepsy/api/api_service.dart';
import 'package:epilepsy/models/seizure_model.dart';
import 'package:epilepsy/models/seizure_type.dart';
import 'package:get/get.dart';

class SeizureTypesController extends GetxController {
  var isLoading = false.obs;
  var seizureTypeList = <SeizureModel>[].obs;

  void fetchSeizureType() async {
    try {
      isLoading(true);
      var fetchSeizureType = await ApiService.fetchSeizureType();
      if (fetchSeizureType != null) {
        seizureTypeList.assignAll(fetchSeizureType.seizureTypeModel);
      }
    } finally {
      isLoading(false);
    }
  }
}
