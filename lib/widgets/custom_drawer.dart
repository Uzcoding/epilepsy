import 'package:epilepsy/api/api_service.dart';
import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/utils/Prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CustomDrawer extends StatelessWidget {
  final Map<int, dynamic> drawerData = {
    0: {
      'icon': AppIcons.drawerCalendar,
      'text': 'Календарь',
      'route': AppRoutes.calendar
    },
    1: {'icon': AppIcons.tendencies, 'text': 'Тенденции'},
    2: {'icon': AppIcons.energy, 'text': 'Лекарства', 'route': AppRoutes.drugs},
    3: {'icon': AppIcons.plants, 'text': 'Тарифы'},
    4: {'icon': AppIcons.eeg, 'text': 'ЭЭГ', 'route': AppRoutes.eeg},
    5: {'icon': AppIcons.news, 'text': 'Новости', 'route': AppRoutes.news},
    6: {
      'icon': AppIcons.settings,
      'text': 'Настройки',
      'route': AppRoutes.settings
    },
    7: {'icon': AppIcons.aboutApp, 'text': 'О приложении'},
    8: {'icon': AppIcons.support, 'text': 'Служба поддержки'},
    9: {'icon': AppIcons.faq, 'text': 'FAQ', 'route': AppRoutes.faq},
  };

  logOut() async {
    print('logOut');
    final int userId = Prefs.userId;
    if (userId != null) {
      final result = await ApiService.logOut(userId);
      print(result);
      await Prefs.clear();
      Get.offAndToNamed(AppRoutes.login);
    }
  }

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
                    onTap: () {
                      drawerData[index]['route'] != null
                          ? Get.toNamed(drawerData[index]['route'])
                          : print('No Route');
                    },
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
                onTap: logOut,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
