import 'package:epilepsy/screens/news/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              itemCount: 3,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 20.0),
              itemBuilder: (context, index) {
                return NewsCard();
              },
            ),
          ),
        )
      ],
    );
  }
}
