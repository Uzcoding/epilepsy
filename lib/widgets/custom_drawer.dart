import 'package:epilepsy/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDrawer extends StatelessWidget {
  final Map<int, dynamic> drawerData = {
    0: {'icon': AppIcons.drawerCalendar, 'text': 'Календарь'},
    1: {'icon': AppIcons.tendencies, 'text': 'Тенденции'},
    2: {'icon': AppIcons.energy, 'text': 'Лекарства'},
    3: {'icon': AppIcons.plants, 'text': 'Тарифы'},
    4: {'icon': AppIcons.eeg, 'text': 'ЭЭГ'},
    5: {'icon': AppIcons.news, 'text': 'Новости'},
    6: {'icon': AppIcons.settings, 'text': 'Настройки'},
    7: {'icon': AppIcons.aboutApp, 'text': 'О приложении'},
    8: {'icon': AppIcons.support, 'text': 'Служба поддержки'},
    9: {'icon': AppIcons.faq, 'text': 'FAQ'},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffoldBackgorund,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Palette.scaffoldBackgorund,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 70.0),
              Expanded(
                child: Column(
                    children: List.generate(
                  drawerData.length,
                  (index) => ListTile(
                    leading: SvgPicture.asset(
                      drawerData[index]['icon'],
                      fit: BoxFit.scaleDown,
                    ),
                    title: Text(
                      drawerData[index]['text'],
                      style: TextStyles.drawerText,
                    ),
                  ),
                )),
              ),
              ListTile(
                leading: SvgPicture.asset(
                  AppIcons.exit,
                  fit: BoxFit.scaleDown,
                ),
                title: Text(
                  'Выход',
                  style: TextStyles.drawerText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
