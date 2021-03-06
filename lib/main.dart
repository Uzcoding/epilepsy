import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/controllers/ProfileController.dart';
import 'package:epilepsy/controllers/last_three_controller.dart';
import 'package:epilepsy/screens/drugs/controllers/endi_drug_controller.dart';
import 'package:epilepsy/screens/drugs/controllers/start_drug_controller.dart';
import 'package:epilepsy/screens/screens.dart';
import 'package:epilepsy/screens/settings/controller/gender_controller.dart';
import 'package:epilepsy/utils/Prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'screens/settings/controller/date_of_birth_controller.dart';

void main() async {
  await GetStorage.init();

  initializeDateFormatting().then((_) => runApp(Epilepsy()));
}

class Epilepsy extends StatefulWidget {
  @override
  _EpilepsyState createState() => _EpilepsyState();
}

class _EpilepsyState extends State<Epilepsy> {
  final token = Prefs.token ?? '';

  final GenderController genderController = Get.put(GenderController());

  final DateOfBirthController dateOfBirthController =
      Get.put(DateOfBirthController());
  final StartDrugController startDrugController =
      Get.put(StartDrugController());

  final EndDrugController endDrugController = Get.put(EndDrugController());
  final ProfileController profileController = Get.put(ProfileController());
  final LastThreeController lastThreeController =
      Get.put(LastThreeController());
  @override
  void initState() {
    if (token != null && token != '') {
      profileController.fetchProfile();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(token);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SF-UI-Display',
        scaffoldBackgroundColor: Palette.scaffoldBackgorund,
        accentColor: Palette.scaffoldBackgorund,
      ),
      getPages: AppPages.pages,
      home: token != null && token != '' ? HomeScreen() : AuthScreen(),
    );
  }
}
