import 'dart:io';

import 'package:dio/dio.dart';
import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/controllers/ProfileController.dart';
import 'package:epilepsy/screens/settings/controller/date_of_birth_controller.dart';
import 'package:epilepsy/screens/settings/controller/gender_controller.dart';
import 'package:epilepsy/screens/settings/widgets/date_birth.dart';
import 'package:epilepsy/screens/settings/widgets/genders.dart';
import 'package:epilepsy/screens/settings/widgets/langguage_choice.dart';
import 'package:epilepsy/screens/settings/widgets/language_choice_dialog.dart';
import 'package:epilepsy/utils/Prefs.dart';
import 'package:epilepsy/utils/sizes.dart';
import 'package:epilepsy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
import 'package:image_picker/image_picker.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ProfileController profileController = g.Get.find<ProfileController>();
  final TextEditingController username = TextEditingController();
  final GenderController genderController = g.Get.find<GenderController>();
  final DateOfBirthController dateOfBirthController =
      g.Get.find<DateOfBirthController>();

  String genderLetter = 'n';

  final Map<int, dynamic> dialogData = {
    0: {
      'title': 'Русский',
      'isChecked': false,
    },
    1: {
      'title': 'English',
      'isChecked': false,
    },
    2: {
      'title': 'O\'zbek',
      'isChecked': false,
    },
  };

  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    profileController.fetchProfile();
    username..text = profileController.profileData.first.profile.name;
  }

  Dio dio = Dio();
  final picker = ImagePicker();
  File _image;

  _imgFromGallery() async {
    try {
      PickedFile pickedFile =
          await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        setState(() {});
      } else {
        return;
      }
    } catch (e) {
      print(e);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(GetSize.width, 100.0),
        child: CustomAppBar(
          onTap: () => g.Get.back(),
          hasAction: false,
          leading: AppIcons.back,
          title: 'Настройки',
        ),
      ),
      body: g.Obx(
        () {
          var data = profileController.profileData;
          if (profileController.isLoading.value) {
            return Center(
              child: cirularLoading(),
            );
          } else if (!profileController.isLoading.value &&
                  profileController.profileData == null ||
              profileController.profileData.isEmpty) {
            Center(
              child: Text('No data'),
            );
          }
          String codeArea = '${data.first.phone.substring(0, 3)}';
          String codeCompany = '${data.first.phone.substring(3, 5)}';
          String number = '${data.first.phone.substring(5)}';
          String formattedPhoneNumber = '+$codeArea ($codeCompany) $number';
          return Column(
            children: [
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(15.0),
                          height: 122.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black87.withOpacity(.2),
                                blurRadius: 3,
                                offset: Offset(2, 2),
                              ),
                            ],
                            color: Palette.scaffoldBackgorund,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: _imgFromGallery,
                                child: CircleAvatar(
                                  radius: 50.0,
                                  foregroundColor: Palette.purple,
                                  backgroundImage: _image != null
                                      ? FileImage(_image)
                                      : NetworkImage(data.first.profile.avatar),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    formattedPhoneNumber,
                                    style: TextStyle(
                                      color: Palette.darkBlue,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 13.0),
                                  Text(
                                    'ID: ${data.first.id.toString()}',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Palette.drugSubtitle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 22.0, bottom: 10.0),
                          child: Text(
                            'ФИО',
                            style: TextStyles.drugCalendar,
                          ),
                        ),
                        TextField(
                          controller: username,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.purple,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            isDense: true,
                            isCollapsed: true,
                            contentPadding: const EdgeInsets.all(18.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Palette.darkBlue,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Palette.darkBlue,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Palette.darkBlue,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            hintText: 'Укажите ваше ФИО',
                            hintStyle: TextStyles.subTitle,
                          ),
                        ),
                        Genders(),
                        DateOfBirth(
                            // dateOfBirth: dateTime,
                            // dateChangerFunction:  pickDate,
                            ),
                        GestureDetector(
                          onTap: () => languageChoiceDialog(dialogData),
                          child: LanguageChoiceListTile(
                            title: 'Язык',
                            subTitle: 'Русский',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: Container(
                  width: 237.0,
                  height: 50.0,
                  margin: const EdgeInsets.only(bottom: 40.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      FormData formData = FormData.fromMap({
                        'name': username.text,
                        'birthday': dateOfBirthController.dateOfBirth.value,
                        'gender': genderController.genderCode.value == 0
                            ? 'n'
                            : genderController.genderCode.value == 1
                                ? 'm'
                                : 'f',
                      });
                      if (_image != null) {
                        String fileName = _image.path.split('/').last;
                        formData.files.addAll([
                          MapEntry(
                            "image",
                            await MultipartFile.fromFile(
                              _image.path,
                              filename: fileName,
                            ),
                          ),
                        ]);
                      }

                      //sending post

                      final token = Prefs.token;
                      var response = await dio.post(
                        ApiUrls.profileUpdate,
                        data: formData,
                        options: Options(
                          headers: {
                            HttpHeaders.authorizationHeader: 'Bearer $token'
                          },
                        ),
                      );
                      if (response.statusCode == 200) {
                        print('okayy');
                      } else {
                        print('error in sending post method in settings dart');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Palette.purple, width: 1.0),
                      elevation: 0.0,
                      primary: Palette.scaffoldBackgorund,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    child: Text('Сохранить', style: TextStyles.drugButton),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
