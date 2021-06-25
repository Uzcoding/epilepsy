import 'package:epilepsy/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomListTile extends StatelessWidget {
  final String leading;
  final String subTitle;
  final String title;
  CustomListTile({
    Key key,
    @required this.leading,
    this.subTitle,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Palette.scaffoldBackgorund,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            offset: Offset(2, 2),
            color: Colors.black.withOpacity(0.2),
          )
        ],
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(leading),
          const SizedBox(width: 11.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                subTitle == null
                    ? Container()
                    : Text(
                        subTitle,
                        style: TextStyles.subTitle,
                      ),
                Text(
                  title,
                  style: TextStyles.accordionTitle,
                ),
              ],
            ),
          ),
          SvgPicture.asset(AppIcons.right),
        ],
      ),
    );
  }
}
