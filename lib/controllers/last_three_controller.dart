import 'package:epilepsy/api/api_service.dart';
import 'package:epilepsy/models/mini_last_three.dart';
import 'package:get/get.dart';
import 'package:epilepsy/models/last_three.dart';

class LastThreeController extends GetxController {
  var isLoading = false.obs;
  var lastThreeList = <MiniLast>[].obs;

  void fetchLastThree() async {
    try {
      isLoading(true);
      var fetchLastThree = await ApiService.fetchLastThree();
      if (fetchLastThree != null) {
        lastThreeList.assignAll(fetchLastThree.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
