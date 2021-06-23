import 'package:epilepsy/api/api_service.dart';
import 'package:epilepsy/models/news.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  var isLoading = false.obs;
  var newsList = <News>[].obs;

  void fetchNews() async {
    try {
      isLoading(true);
      var fetchedNews = await ApiService.fetchNews();
      if (fetchedNews != null) {
        newsList.assignAll(fetchedNews.news);
      }
    } finally {
      isLoading(false);
    }
  }
}
