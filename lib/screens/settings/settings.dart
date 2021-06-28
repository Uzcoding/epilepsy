import 'dart:io';

import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/controllers/ProfileController.dart';
import 'package:epilepsy/models/models.dart';
import 'package:epilepsy/screens/settings/date_birth.dart';
import 'package:epilepsy/screens/settings/genders.dart';
import 'package:epilepsy/screens/settings/widgets/langguage_choice.dart';
import 'package:epilepsy/screens/settings/widgets/language_choice_dialog.dart';
import 'package:epilepsy/utils/sizes.dart';
import 'package:epilepsy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ProfileController profileController = Get.put(ProfileController());
  final picker = ImagePicker();
  File _image;

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

  @override
  void initState() {
    super.initState();
    profileController.fetchProfile();
  }

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
          onTap: () => Get.back(),
          hasAction: false,
          leading: AppIcons.back,
          title: 'Настройки',
        ),
      ),
      body: Obx(
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
                        DateOfBirth(),
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
                    onPressed: () {},
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
