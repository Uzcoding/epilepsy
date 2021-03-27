import 'package:epilepsy/config/config.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130.0,
      decoration: BoxDecoration(
        color: Palette.card,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(.2),
            blurRadius: 2,
            offset: Offset(2, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Без припадков',
            style: const TextStyle(
              fontFamily: 'SF-UI-Display',
              color: Palette.darkBlue,
              fontSize: 14.0,
            ),
          ),
          Text(
            '02:08:32',
            style: const TextStyle(
              fontSize: 35.0,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w700,
              color: Palette.darkBlue,
            ),
          ),
          const SizedBox(height: 4.0),
          Container(
            width: 150.0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'дни'.toUpperCase(),
                    style: TextStyles.cardData,
                  ),
                  Text(
                    'часы'.toUpperCase(),
                    style: TextStyles.cardData,
                  ),
                  Text(
                    'мин'.toUpperCase(),
                    style: TextStyles.cardData,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
