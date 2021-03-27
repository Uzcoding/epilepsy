import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/screens/drugs/widgets/widgets.dart';
import 'package:epilepsy/utils/sizes.dart';
import 'package:epilepsy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrugsScreen extends StatelessWidget {
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
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                itemCount: 3,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20.0),
                itemBuilder: (context, index) {
                  return DrugsCard();
                },
              ),
            ),
          ),
          DrugsButton()
        ],
      ),
    );
  }
}
