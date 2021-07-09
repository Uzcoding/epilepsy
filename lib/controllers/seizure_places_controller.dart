import 'package:epilepsy/api/api_service.dart';
import 'package:epilepsy/models/seizure_model.dart';
import 'package:epilepsy/models/seizure_type.dart';
import 'package:get/get.dart';

class SeizurePlacesController extends GetxController {
  var isLoading = false.obs;
  var seizurePlacesList = <SeizureModel>[].obs;

  void fetchSeizurePlace() async {
    try {
      isLoading(true);
      var fetchSeizurePlaces = await ApiService.fetchSeizurePlaces();
      if (fetchSeizurePlaces != null) {
        seizurePlacesList.assignAll(fetchSeizurePlaces.seizureTypeModel);
      }
    } finally {
      isLoading(false);
    }
  }
}
