import 'dart:io';

import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/utils/Prefs.dart';
import 'package:epilepsy/utils/sizes.dart';
import 'package:epilepsy/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';

class AddEEGScreen extends StatefulWidget {
  @override
  _AddEEGScreenState createState() => _AddEEGScreenState();
}

class _AddEEGScreenState extends State<AddEEGScreen> {
  DateTime dateTime;
  Dio dio = Dio();
  TextEditingController comments = TextEditingController();
  @override
  void initState() {
    dateTime = DateTime.now();
    super.initState();
  }

  final Map<int, dynamic> addDrugsData = {
    0: {
      'leading': AppIcons.accessMind,
      'title': 'Прикрепить фото',
      'route': 'null',
    },
    1: {
      'leading': AppIcons.accessCalendar,
      'subTitle': 'Дата снимка',
      'title': 'Четверг январь 28.2021',
      'route': AppRoutes.addEEGCalendar
    },
    // 2: {
    //   'leading': AppIcons.accessCalendar,
    //   'title': 'Выбрать дату окончания',
    // },
  };

  File _image;
  final picker = ImagePicker();
  _imgFromGallery() async {
    try {
      PickedFile pickedFile = await picker.getImage(
        ImageSource: ImageSource.gallery,
      );
      // PickedFile pickedFile =
      //     await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

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
  // Future getUserImage() async {
  //   final pickedUserImage =
  //       await userImagePicker.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (pickedUserImage != null) {
  //       _image = File(pickedUserImage.path);
  //       print('successs');
  //     } else {
  //       print('No Image Selected');
  //     }
  //   });
  // }
  // _imgFromGallery() async {
  //   try {
  //     PickedFile pickedFile =
  //         await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //       setState(() {});
  //     } else {
  //       return;
  //     }
  //   } catch (e) {
  //     print(e);
  //     return;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAEBF3),
      appBar: PreferredSize(
        preferredSize: Size(GetSize.width, 100.0),
        child: CustomAppBar(
          onTap: () => g.Get.back(),
          hasAction: false,
          leading: AppIcons.back,
          title: 'Добавить ЭЭГ',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(children: [
                      GestureDetector(
                        onTap: _imgFromGallery,
                        child: CustomListTile(
                          leading: AppIcons.accessCalendar,
                          subTitle: 'Прикрепить фото',
                          title: '',
                        ),
                      ),
                      _image != null ? Image.file(_image) : SizedBox(),
                      GestureDetector(
                        onTap: _pickDate,
                        child: CustomListTile(
                          leading: AppIcons.accessMind,
                          subTitle: 'Дата снимка',
                          // title: dateTime.toString(),
                          title: DateFormat.yMMMd('ru').format(dateTime),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Text(
                        'Комментарий',
                        style: TextStyles.drugCalendar,
                      ),
                    ),
                    TextField(
                      controller: comments,
                      maxLines: 4,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Введите комментарий',
                        hintStyle: TextStyles.subTitle,
                      ),
                    ),
                  ],
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
                      'comment': comments.text,
                      'date': dateTime.toString(),
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

                    final token = Prefs.token;
                    var response = await dio.post(
                      ApiUrls.eegStore,
                      data: formData,
                      options: Options(
                        headers: {
                          HttpHeaders.authorizationHeader: 'Bearer $token'
                        },
                      ),
                    );

                    if (response.statusCode == 200) {
                      print('okayy');
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
        ),
      ),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (date != null) {
      setState(() {
        dateTime = date;
        // dateTime = date;
      });
    }
  }
}
