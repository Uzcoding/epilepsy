import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/models/drug_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrugsCardBottom extends StatelessWidget {
  final DrugList drugList;

  const DrugsCardBottom({Key key, this.drugList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0, bottom: 10.0, top: 10.0),
      decoration: BoxDecoration(color: Palette.drugFooter),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            AppIcons.calendar,
            color: Palette.darkBlue,
          ),
          const SizedBox(width: 11.0),
          Text(
            // '22.09.2021 - 22.10.2021',
            drugList.dateStart.toString() + '-' + drugList.dateEnd.toString(),
            style: TextStyles.drugCalendar,
          )
        ],
      ),
    );
  }
}
