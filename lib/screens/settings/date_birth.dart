import 'package:epilepsy/config/icons.dart';
import 'package:epilepsy/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateOfBirth extends StatefulWidget {
  @override
  _DateOfBirthState createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  @override
  void initState() {
    dateTime = DateTime.now();
    super.initState();
  }

  DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: _pickDate,
        child: CustomListTile(
          leading: AppIcons.accessMind,
          subTitle: 'Дата снимка',
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
        // dateTime = date;
      });
    }
  }
}
