import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StartDrugController extends GetxController {
  var startDrugDate = ''.obs;
  void setStartDrugDate(DateTime dateTime) {
    // dateOfBirth.value = dateTime.toString();
    startDrugDate.value = DateFormat.yMd().format(dateTime);
    // DateFormat.yMd().format(dateOfBirth.value);
    print('date of start drug changed $startDrugDate');
    print(startDrugDate.value);
  }
}
