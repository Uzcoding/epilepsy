import 'package:epilepsy/controllers/druglist_controller.dart';
import 'package:epilepsy/models/drug_list.dart';
import 'package:epilepsy/screens/drugs/widgets/button.dart';
import 'package:epilepsy/screens/drugs/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final DrugController drugController = Get.find<DrugController>();
  @override
  void initState() {
    print('tjis is int state body');
    drugController.fetchDrugs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var data = drugController.drugList;
      if (drugController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (!drugController.isLoading.value && data == null ||
          data.isEmpty) {
        Center(
          child: Text('No data'),
        );
      }
      return Column(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                itemCount: drugController.drugList.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20.0),
                itemBuilder: (context, index) {
                  final DrugList drugList = data[index];

                  return DrugsCard(
                    drugList: drugList,
                  );
                },
              ),
            ),
          ),
          DrugsButton()
        ],
      );
    });
  }
}
