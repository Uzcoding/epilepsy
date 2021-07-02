import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/models/drug_list.dart';
import 'package:epilepsy/screens/drugs/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DrugsCard extends StatelessWidget {
  final DrugList drugList;
  const DrugsCard({
    Key key,
    this.drugList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          DrugsCardTop(
            drugList: drugList,
          ),
          DrugsCardBottom(
            drugList: drugList,
          ),
        ],
      ),
    );
  }
}
