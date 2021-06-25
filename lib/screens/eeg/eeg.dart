import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/controllers/EEGController.dart';
import 'package:epilepsy/screens/eeg/widgets/body.dart';
import 'package:epilepsy/utils/sizes.dart';
import 'package:epilepsy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EEGScreen extends StatefulWidget {
  @override
  _EEGScreenState createState() => _EEGScreenState();
}

class _EEGScreenState extends State<EEGScreen> {
  final EEGController eegController = Get.put(EEGController());
  @override
  void initState() {
    super.initState();
    eegController.fetchEEGs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(GetSize.width, 100.0),
        child: CustomAppBar(
          onTap: () => Get.back(),
          hasAction: false,
          leading: AppIcons.back,
          title: 'ЭЭГ',
        ),
      ),
      body: Body(),
    );
  }
}
