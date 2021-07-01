import 'package:get/get.dart';

class GenderController extends GetxController {
  var genderCode = 0.obs;

  void maleChoice() {
    genderCode.value = 1;
    print('male choice $genderCode ');
  }

  void returningGenderCode() {
    print('code is $genderCode');
  }

  void femaleChoice() {
    genderCode.value = 2;
    print('female choice $genderCode ');
  }
}
