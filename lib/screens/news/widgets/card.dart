import 'package:epilepsy/config/config.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(.2),
            blurRadius: 3,
            offset: Offset(2, 2),
          ),
        ],
        color: Palette.scaffoldBackgorund,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 15.0),
            width: double.infinity,
            child: Image.asset(
              AppImages.news,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 300.0,
            margin: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              'Школу для пациентов с эпилепсией открыли в Самарканде',
              softWrap: true,
              style: TextStyles.newsText,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '14 января 2021',
                style: TextStyles.newsDate,
              ),
              SizedBox(
                width: 114.0,
                height: 28.0,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Подробнее',
                    style: TextStyles.newsButton,
                  ),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Palette.purple, width: 1.0),
                    elevation: 0.0,
                    primary: Palette.scaffoldBackgorund,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
