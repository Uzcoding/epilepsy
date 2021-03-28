import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/utils/sizes.dart';
import 'package:epilepsy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewAccessScreen extends StatelessWidget {
  final Map<int, dynamic> accessData = {
    0: {
      'leading': AppIcons.accessCalendar,
      'subTitle': '13:30',
      'title': 'Четверг январь 28.2021',
    },
    1: {
      'leading': AppIcons.accessClock,
      'subTitle': 'Длительность',
      'title': '00:27',
    },
    2: {
      'leading': AppIcons.accessMind,
      'subTitle': 'Вид припадка',
      'title': 'Название припадка',
    },
    3: {
      'leading': AppIcons.note,
      'subTitle': 'Причина',
      'title': 'Добавить причину',
    },
    4: {
      'leading': AppIcons.run,
      'subTitle': 'Активность',
      'title': 'Добавить активность',
    },
    5: {
      'leading': AppIcons.mark,
      'subTitle': 'Место',
      'title': 'Добавить место',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(GetSize.width, 100.0),
        child: CustomAppBar(
          onTap: () => Get.back(),
          hasAction: false,
          leading: AppIcons.back,
          title: 'Новый приступ',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: List.generate(
                        accessData.length,
                        (index) => CustomListTile(
                          leading: accessData[index]['leading'],
                          subTitle: accessData[index]['subTitle'],
                          title: accessData[index]['title'],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Text(
                        'Добавить примечание',
                        style: TextStyles.drugCalendar,
                      ),
                    ),
                    TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Примечание',
                        hintStyle: TextStyles.subTitle,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Center(
                      child: Container(
                        width: 237.0,
                        height: 50.0,
                        margin: const EdgeInsets.only(bottom: 40.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(color: Palette.purple, width: 1.0),
                            elevation: 0.0,
                            primary: Palette.scaffoldBackgorund,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          child:
                              Text('Сохранить', style: TextStyles.drugButton),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
