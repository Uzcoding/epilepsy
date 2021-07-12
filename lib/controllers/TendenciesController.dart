import 'package:epilepsy/api/api_service.dart';
import 'package:epilepsy/models/tendencies.dart';
import 'package:get/get.dart';

class TendenciesController extends GetxController {
  var isLoading = false.obs;
  var statistics = <Tendencies>[].obs;

  void fetchStatistics() async {
    try {
      isLoading(true);
      var fetchedStatistics = await ApiService.fetchStatistics();
      if (fetchedStatistics != null) {
        statistics.add(fetchedStatistics.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
