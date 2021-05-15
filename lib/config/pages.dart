import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/screens/home.dart';
import 'package:epilepsy/screens/screens.dart';
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
  ];
}
