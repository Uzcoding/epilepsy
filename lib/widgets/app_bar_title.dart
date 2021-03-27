import 'package:epilepsy/config/config.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final bool isHome;
  final String title;

  const AppBarTitle({
    Key key,
    this.isHome,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isHome
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'C',
                style: TextStyles.appBarTitle,
              ),
              Text(
                'Epi',
                style: TextStyles.appBarTitle.copyWith(color: Palette.purple),
              ),
            ],
          )
        : Text(
            title ?? "not exist text",
            style: TextStyles.trainerCardTitle,
          );
  }
}
