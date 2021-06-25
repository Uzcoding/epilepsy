import 'package:epilepsy/controllers/EEGController.dart';
import 'package:epilepsy/models/EEGModel.dart';
import 'package:epilepsy/screens/drugs/widgets/button.dart';
import 'package:epilepsy/screens/eeg/widgets/add_eeg_button.dart';
import 'package:epilepsy/screens/eeg/widgets/card.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  final EEGController eegController = Get.find<EEGController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var data = eegController.eegList;
        if (eegController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!eegController.isLoading.value && data == null ||
            data.isEmpty) {
          Center(
            child: Text('No data'),
          );
        }
        return Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: ListView.separated(
                  clipBehavior: Clip.none,
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  itemCount: data.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20.0),
                  itemBuilder: (context, index) {
                    final EEGModel eegModel = data[index];
                    // initializeDateFormatting();
                    final date = DateFormat('dd.M.yyyy').parse(eegModel.date);
                    final formattedDate =
                        DateFormat('dd MMMM yyyy', 'ru_RU').format(date);
                    return EEGCard(
                        eegModel: eegModel, date: formattedDate.toString());
                  },
                ),
              ),
            ),
            AddEEGButton(),
          ],
        );
      },
    );
  }
}
