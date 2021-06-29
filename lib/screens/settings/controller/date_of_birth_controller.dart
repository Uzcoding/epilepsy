import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateOfBirthController extends GetxController {
  var dateOfBirth = ''.obs;
  void setDateOfBirth(DateTime dateTime) {
    // dateOfBirth.value = dateTime.toString();
    dateOfBirth.value = DateFormat.yMd().format(dateTime);
    // DateFormat.yMd().format(dateOfBirth.value);
    print('date of birth changed $dateOfBirth');
    print(dateOfBirth.value);
  }

  // RxString dateOfBirth2 = ''.obs;

  // void setDateOfBirth2(DateTime dateTime) {
  //   // dateOfBirth.value = dateTime.toString();
  //   // dateOfBirth.value = DateFormat.yMd().format(dateTime);
  //   // DateFormat.yMd().format(dateOfBirth.value);
  //   print('date of birth changed $dateOfBirth2');
  // }
}
