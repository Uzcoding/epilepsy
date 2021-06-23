import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/screens/screens.dart';
import 'package:epilepsy/utils/Prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await GetStorage.init();

  initializeDateFormatting().then((_) => runApp(Epilepsy()));
}

class Epilepsy extends StatelessWidget {
  final token = Prefs.token ?? '';
  @override
  Widget build(BuildContext context) {
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
