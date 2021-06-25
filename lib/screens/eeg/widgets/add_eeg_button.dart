import 'package:epilepsy/config/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEEGButton extends StatelessWidget {
  const AddEEGButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 237.0,
      height: 50.0,
      margin: const EdgeInsets.only(bottom: 40.0, top: 10.0),
      child: ElevatedButton(
        onPressed: () => Get.toNamed(AppRoutes.addEEG),
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: Palette.purple, width: 1.0),
          elevation: 0.0,
          primary: Palette.scaffoldBackgorund,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        child: Text(
          'Добавить',
          style: TextStyles.drugButton,
        ),
      ),
    );
  }
}
