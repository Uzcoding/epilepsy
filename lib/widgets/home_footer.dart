import 'package:epilepsy/config/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      width: double.infinity,
      height: 64.0,
      child: ElevatedButton(
        onPressed: () => Get.toNamed(AppRoutes.access),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Palette.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
        child: Text(
          'Приступ',
          style: const TextStyle(
            fontFamily: 'SF-UI-Display',
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
