import 'package:get_storage/get_storage.dart';

class Prefs {
  static final prefs = GetStorage();

  static get token => prefs.read('TOKEN');
  static get code => prefs.read('CODE');
  static get userId => prefs.read('USERID');

  static set token(String value) => prefs.write('TOKEN', value);
  static set code(String value) => prefs.write('CODE', value);
  static set userId(int value) => prefs.write('USERID', value);

  static clear() {
    prefs.remove('TOKEN');
    prefs.remove('CODE');
    prefs.remove('USERID');
  }
}
