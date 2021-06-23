import 'package:epilepsy/api/api_service.dart';
import 'package:epilepsy/models/faq.dart';
import 'package:get/get.dart';

class FAQsController extends GetxController {
  var isLoading = false.obs;
  var faqsList = <FAQ>[].obs;

  void fetchFAQs() async {
    try {
      isLoading(true);
      var fetchedfaqs = await ApiService.fetchFAQs();
      if (fetchedfaqs != null) {
        faqsList.assignAll(fetchedfaqs.faq);
      }
    } finally {
      isLoading(false);
    }
  }
}
