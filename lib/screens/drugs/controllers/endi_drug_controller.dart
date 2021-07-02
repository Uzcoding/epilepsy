import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EndDrugController extends GetxController {
  var endDrugDate = ''.obs;
  void setEndDrugDate(DateTime dateTime) {
    // dateOfBirth.value = dateTime.toString();
    endDrugDate.value = DateFormat.yMd().format(dateTime);
    // DateFormat.yMd().format(dateOfBirth.value);
    print('date of end drug changed $endDrugDate');
    print(endDrugDate.value);
  }
}
