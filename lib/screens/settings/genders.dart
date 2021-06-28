import 'package:epilepsy/config/colors.dart';
import 'package:epilepsy/config/styles.dart';
import 'package:flutter/material.dart';

class Genders extends StatefulWidget {
  @override
  _GendersState createState() => _GendersState();
}

class _GendersState extends State<Genders> {
  int selectedButton = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Пол',
              style: TextStyle(
                fontFamily: 'SF UI Display',
                fontSize: 14,
                color: const Color(0xff0e3062),
                letterSpacing: 0.003920000016689301,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 9),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 156,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xb2ffffff),
                        offset: Offset(-2, -2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedButton = 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      side: selectedButton == 1
                          ? BorderSide(color: Palette.purple, width: 1.0)
                          : BorderSide(color: Colors.white, width: 1.0),
                      elevation: 0.0,
                      primary: selectedButton == 1
                          ? Palette.purple
                          : Palette.scaffoldBackgorund,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text('Муж',
                        style: selectedButton == 1
                            ? TextStyle(color: Colors.white, fontSize: 20)
                            : TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                ),
                Container(
                  height: 50,
                  width: 156,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xb2ffffff),
                        offset: Offset(-2, -2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedButton = 2;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      side: selectedButton == 2
                          ? BorderSide(color: Palette.purple, width: 1.0)
                          : BorderSide(color: Colors.white, width: 1.0),
                      elevation: 0.0,
                      primary: selectedButton == 2
                          ? Palette.purple
                          : Palette.scaffoldBackgorund,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Жен',
                      style: selectedButton == 2
                          ? TextStyle(color: Colors.white, fontSize: 20)
                          : TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
