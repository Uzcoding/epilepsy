import 'package:epilepsy/api/api_service.dart';
import 'package:epilepsy/models/seizures.dart';
import 'package:get/get.dart';

class SeizuresController extends GetxController {
  var isLoading = false.obs;
  var seizuresList = <Seizures>[].obs;

  void fetchSeizuresByDate(date) async {
    try {
      isLoading(true);
      var fetchedSeizures = await ApiService.fetchSeizuresByDate(date);
      if (fetchedSeizures != null) {
        seizuresList.assignAll(fetchedSeizures.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
