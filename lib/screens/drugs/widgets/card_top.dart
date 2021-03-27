import 'package:epilepsy/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrugsCardTop extends StatelessWidget {
  const DrugsCardTop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0).copyWith(right: 0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppIcons.energy),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Диазепам (Валиум)',
                    style: TextStyles.trainerCardTitle,
                  ),
                  Text(
                    'Дозировка',
                    style: TextStyles.drugSubTitle,
                  ),
                  Container(
                    width: 300.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            '2 р. В день через час после еды',
                            style: TextStyles.drugText,
                          ),
                        ),
                        SvgPicture.asset(AppIcons.right),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
