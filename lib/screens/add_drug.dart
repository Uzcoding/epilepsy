import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/utils/sizes.dart';
import 'package:epilepsy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDrugScreen extends StatelessWidget {
  final Map<int, dynamic> addDrugsData = {
    0: {
      'leading': AppIcons.accessCalendar,
      'subTitle': '13:30',
      'title': 'Четверг январь 28.2021',
    },
    1: {
      'leading': AppIcons.accessCalendar,
      'title': 'Выбрать дату окончания',
    },
    2: {
      'leading': AppIcons.accessMind,
      'title': 'Прикрепить фото',
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
          title: 'Добавить лекрство',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Text(
                        'Название лекарства',
                        style: TextStyles.drugCalendar,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 15.0,
                        ),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Введите название',
                        hintStyle: TextStyles.subTitle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Text(
                        'Дозировка',
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
                        hintText: 'Введите необходимую дозировку',
                        hintStyle: TextStyles.subTitle,
                      ),
                    ),
                    Column(
                      children: List.generate(
                        addDrugsData.length,
                        (index) => CustomListTile(
                          leading: addDrugsData[index]['leading'],
                          subTitle: addDrugsData[index]['subTitle'],
                          title: addDrugsData[index]['title'],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Text(
                        'Комментарий',
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
                        hintText: 'Введите комментарий',
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
            )
          ],
        ),
      ),
    );
  }
}
