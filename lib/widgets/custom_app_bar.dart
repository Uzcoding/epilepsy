import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Function onTap;
  final bool hasAction;
  final bool isHome;
  final String leading;
  final String title;

  const CustomAppBar({
    Key key,
    this.onTap,
    this.hasAction = false,
    this.leading = AppIcons.drawer,
    this.isHome = false,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBarButton(
              icon: leading,
              onTap: onTap,
            ),
            AppBarTitle(isHome: isHome, title: title),
            hasAction
                ? AppBarButton(
                    icon: AppIcons.plus,
                    onTap: () {},
                  )
                : Container(
                    width: 37.0,
                    height: 37.0,
                  ),
          ],
        ),
      ),
    );
  }
}
