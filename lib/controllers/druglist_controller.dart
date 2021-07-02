import 'package:epilepsy/api/api_service.dart';
import 'package:epilepsy/models/drug_list.dart';
import 'package:get/get.dart';

class DrugController extends GetxController {
  var isLoading = false.obs;
  var drugList = <DrugList>[].obs;

  void fetchDrugs() async {
    try {
      isLoading(true);
      var fetchedDrugs = await ApiService.fetchdrugs();
      if (fetchedDrugs != null) {
        drugList.assignAll(fetchedDrugs.druglist);
      }
    } finally {
      isLoading(false);
    }
  }
}
