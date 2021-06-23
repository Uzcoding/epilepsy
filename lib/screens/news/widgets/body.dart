import 'package:epilepsy/controllers/NewsController.dart';
import 'package:epilepsy/models/news.dart';
import 'package:epilepsy/screens/news/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  final NewsController newsController = Get.find<NewsController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var data = newsController.newsList;
        if (newsController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!newsController.isLoading.value && data == null ||
            data.isEmpty) {
          Center(
            child: Text('No data'),
          );
        }
        return Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: ListView.separated(
                  clipBehavior: Clip.none,
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  itemCount: data.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20.0),
                  itemBuilder: (context, index) {
                    final News news = data[index];
                    initializeDateFormatting();
                    final date = DateFormat('dd.M.yyyy').parse(news.date);
                    final formattedDate =
                        DateFormat('dd MMMM yyyy', 'ru_RU').format(date);
                    return NewsCard(news: news, date: formattedDate.toString());
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
