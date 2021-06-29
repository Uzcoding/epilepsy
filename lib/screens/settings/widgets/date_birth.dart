import 'package:epilepsy/screens/settings/controller/date_of_birth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:epilepsy/config/icons.dart';
import 'package:epilepsy/widgets/custom_list_tile.dart';

class DateOfBirth extends StatefulWidget {
  @override
  _DateOfBirthState createState() => _DateOfBirthState();
  // final DateTime dateOfBirth;
  // final Function dateChangerFunction;
  // const DateOfBirth({
  //   @required this.dateOfBirth,
  //   @required this.dateChangerFunction,
  // });
}

class _DateOfBirthState extends State<DateOfBirth> {
  final DateOfBirthController dateOfBirthController =
      Get.find<DateOfBirthController>();
  DateTime dateTime;
  @override
  void initState() {
    dateTime = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        // onTap: widget.dateChangerFunction(dateTime),
        onTap: _pickDate,
        child: CustomListTile(
          leading: AppIcons.accessMind,
          subTitle: 'Дата рождения',
          // title: dateTime.toString(),
          title: DateFormat.yMMMd('ru').format(dateTime),
        ),
      ),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (date != null) {
      setState(() {
        dateTime = date;
      });
      dateOfBirthController.setDateOfBirth(date);
    }
  }
}
