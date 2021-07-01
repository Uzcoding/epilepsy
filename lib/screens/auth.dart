import 'package:epilepsy/api/api_service.dart';
import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/utils/Prefs.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var phoneFormatter = MaskTextInputFormatter(
      mask: '+998 (##) ###-##-##', filter: {"#": RegExp(r'[0-9]')});
  TextEditingController controller;

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    controller = TextEditingController(text: '+998 ');
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  phoneValidation() async {
    if (_formKey.currentState.validate()) {
      try {
        isLoading = true;
        if (controller.text.isNotEmpty) {
          String phoneNumber = '998${phoneFormatter.getUnmaskedText()}';
          var result = await ApiService.login(phoneNumber);
          var userCode = result.data.code;
          var userId = result.data.userId;
          if (userId != null) {
            Prefs.userId = userId;
          }
          if (userCode.isNotEmpty && userCode != null) {
            Prefs.code = userCode;
          }
          Navigator.pushReplacementNamed(context, AppRoutes.confirm);
        }

        setState(() {});
      } catch (e) {
        print('Error in login: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка! попробуйте позже'),
            backgroundColor: Colors.red,
          ),
        );
        isLoading = false;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'C',
                      style: TextStyles.appBarTitle.copyWith(fontSize: 50.0),
                    ),
                    Text(
                      'Epi',
                      style: TextStyles.appBarTitle
                          .copyWith(color: Palette.purple, fontSize: 50.0),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Здраствуйте, мы рады что Вы выбрали нас',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Palette.darkBlue,
              ),
            ),
            Text(
              'Давайте зарегистрируем Вас',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Palette.darkBlue,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20.0).copyWith(top: 30.0),
                height: 60.0,
                child: TextFormField(
                  validator: (value) {
                    if (value.length != 19) {
                      return 'Пожалуйста, введите ваш номер';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  inputFormatters: [phoneFormatter],
                  controller: controller,
                  cursorColor: Palette.purple,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Palette.purple,
                      size: 30.0,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    isDense: true,
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.all(23.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    hintText: 'Введите Ваш номер',
                    hintStyle: TextStyles.subTitle,
                  ),
                ),
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)
                      .copyWith(bottom: 50.0),
              width: double.infinity,
              height: 64.0,
              child: ElevatedButton(
                onPressed: isLoading ? null : phoneValidation,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Palette.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                child: isLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : Text(
                        'Продолжить',
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
