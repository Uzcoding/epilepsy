import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/screens/eeg/eeg.dart';
import 'package:epilepsy/screens/eeg/widgets/add_eeg_body.dart';
import 'package:epilepsy/screens/eeg/widgets/add_eeg_calendar.dart';
import 'package:epilepsy/screens/screens.dart';
import 'package:epilepsy/screens/seizures.dart';

import 'package:get/get.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(name: '${AppRoutes.home}', page: () => HomeScreen()),
    GetPage(name: '${AppRoutes.news}', page: () => NewsScreen()),
    GetPage(name: '${AppRoutes.access}', page: () => NewAccessScreen()),
    GetPage(name: '${AppRoutes.calendar}', page: () => CalendarScreen()),
    GetPage(name: '${AppRoutes.faq}', page: () => FaqScreen()),
    GetPage(name: '${AppRoutes.addDrug}', page: () => AddDrugScreen()),
    GetPage(name: '${AppRoutes.drugs}', page: () => DrugsScreen()),
    GetPage(name: '${AppRoutes.login}', page: () => AuthScreen()),
    GetPage(name: '${AppRoutes.confirm}', page: () => ConfirmCodeScreen()),
    GetPage(name: '${AppRoutes.settings}', page: () => SettingsScreen()),
    GetPage(name: '${AppRoutes.settings}', page: () => SettingsScreen()),
    GetPage(name: '${AppRoutes.eeg}', page: () => EEGScreen()),
    GetPage(name: '${AppRoutes.addEEG}', page: () => AddEEGScreen()),
    GetPage(name: '${AppRoutes.seizures}', page: () => SeizuresScreen()),
    GetPage(
        name: '${AppRoutes.addEEGCalendar}',
        page: () => AddEEGCalendarScreen()),
  ];
}
