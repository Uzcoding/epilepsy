import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/controllers/druglist_controller.dart';
import 'package:epilepsy/screens/drugs/widgets/body.dart';
import 'package:epilepsy/screens/drugs/widgets/widgets.dart';
import 'package:epilepsy/utils/sizes.dart';
import 'package:epilepsy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrugsScreen extends StatelessWidget {
  final DrugController drugController = Get.put(DrugController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(GetSize.width, 100.0),
        child: CustomAppBar(
          onTap: () => Get.back(),
          hasAction: false,
          leading: AppIcons.back,
          title: 'Лекарства',
        ),
      ),
      body: Body(),
    );
  }
}
