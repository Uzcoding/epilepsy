import 'package:epilepsy/api/api_service.dart';
import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/utils/Prefs.dart';
import 'package:flutter/material.dart';

class ConfirmCodeScreen extends StatefulWidget {
  const ConfirmCodeScreen({Key key}) : super(key: key);

  @override
  _ConfirmCodeScreenState createState() => _ConfirmCodeScreenState();
}

class _ConfirmCodeScreenState extends State<ConfirmCodeScreen> {
  TextEditingController controller;

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  codeVerify() async {
    if (_formKey.currentState.validate()) {
      try {
        isLoading = true;
        final storageCode = Prefs.code;
        final String code = controller.text;
        final int userId = Prefs.userId;
        print(storageCode);
        print(userId);
        final result = await ApiService.verify(userId, code: code);
        final String token = result.data.token;
        if (token != null && token.isNotEmpty) {
          Prefs.token = token;
          print(token);
          Navigator.pushReplacementNamed(context, AppRoutes.home);
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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Пожалуйста, введите код,',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Palette.darkBlue,
                    ),
                  ),
                  Text(
                    'который мы прислали по SMS',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Palette.darkBlue,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20.0).copyWith(top: 30.0),
                height: 60.0,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 5,
                  validator: (value) {
                    if (value.length != 5) {
                      return 'Пожалуйста, введите код';
                    }
                    return null;
                  },
                  controller: controller,
                  cursorColor: Palette.purple,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    prefixIcon: Icon(
                      Icons.password,
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
                    hintText: 'Введите код',
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
                onPressed: codeVerify,
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
                        'Отправить',
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
