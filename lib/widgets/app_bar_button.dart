import 'package:epilepsy/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarButton extends StatelessWidget {
  final String icon;
  final Function onTap;

  const AppBarButton({
    Key key,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 37.0,
      height: 37.0,
      decoration: BoxDecoration(
        color: Palette.scaffoldBackgorund,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(.2),
            blurRadius: 3,
            offset: Offset(2, 2), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Material(
          color: Palette.scaffoldBackgorund,
          child: InkWell(
            onTap: onTap,
            child: SvgPicture.asset(
              icon,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
