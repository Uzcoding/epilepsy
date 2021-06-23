import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/models/faq.dart';
import 'package:epilepsy/utils/epilepsy_icons.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;

class FAQCard extends StatelessWidget {
  final FAQ data;
  const FAQCard({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var answer = parse(data.answer);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
      child: ExpandablePanel(
        theme: ExpandableThemeData(
          hasIcon: false,
        ),
        header: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Palette.scaffoldBackgorund,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black87.withOpacity(.2),
                blurRadius: 2,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  data.question,
                  style: TextStyles.accordionTitle,
                ),
              ),
              ExpandableIcon(
                theme: ExpandableThemeData(
                  expandIcon: EpilepsyIcons.right_open,
                  collapseIcon: EpilepsyIcons.down_open,
                  iconSize: 18.0,
                  iconColor: Palette.accordionIcon,
                ),
              )
            ],
          ),
        ),
        collapsed: Container(),
        expanded: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            answer.body.text,
            style: TextStyles.accordionText,
            softWrap: true,
          ),
        ),
      ),
    );
  }
}
