import 'package:epilepsy/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TrainerCard extends StatelessWidget {
  final String place;
  final String reason;
  final String type;
  final String date;
  final String duration;
  final String activity;
  const TrainerCard({
    @required this.place,
    @required this.reason,
    @required this.type,
    @required this.date,
    @required this.duration,
    @required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.card,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(.2),
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 5.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 'Тренажерный зал',
                    place,
                    style: TextStyles.trainerCardTitle,
                  ),
                  const SizedBox(height: 18.0),
                  Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.mind,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            // 'Атонический',
                            type,
                            style: TextStyles.trainerCardText,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10.0),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.note,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            // 'Стресс',
                            reason,
                            style: TextStyles.trainerCardText,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.run,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            activity,
                            // 'Экзамен',
                            style: TextStyles.trainerCardText,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 102.0,
            height: 128.0,
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Palette.trainerRight,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 92.0,
                  height: 58.0,
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.calendar,
                            fit: BoxFit.scaleDown,
                          ),
                          const SizedBox(width: 7.0),
                          Text(
                            // '13:30',
                            date,
                            style: const TextStyle(
                              fontFamily: 'SF-UI-Display',
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        // 'четверг 22/09',
                        date,
                        style: const TextStyle(
                          fontFamily: 'SF-UI-Display',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 92.0,
                  height: 58.0,
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.3),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Длительность',
                        style: const TextStyle(
                          fontFamily: 'SF-UI-Display',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 11.0,
                        ),
                      ),
                      const SizedBox(height: 7.0),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.clock,
                            fit: BoxFit.scaleDown,
                          ),
                          const SizedBox(width: 7.0),
                          Text(
                            // '00:27',
                            duration,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'SF-UI-Display',
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
