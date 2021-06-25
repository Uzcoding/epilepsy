import 'package:epilepsy/api/api_service.dart';
import 'package:epilepsy/models/EEGModel.dart';
import 'package:get/get.dart';

class EEGController extends GetxController {
  var isLoading = false.obs;
  var eegList = <EEGModel>[].obs;

  void fetchEEGs() async {
    try {
      isLoading(true);
      var fetchedEEGs = await ApiService.fetchEEG();
      if (fetchedEEGs != null) {
        eegList.assignAll(fetchedEEGs.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
