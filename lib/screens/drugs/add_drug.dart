import 'dart:io';

import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/screens/drugs/controllers/endi_drug_controller.dart';
import 'package:epilepsy/screens/drugs/controllers/start_drug_controller.dart';
import 'package:epilepsy/utils/Prefs.dart';
import 'package:epilepsy/utils/sizes.dart';
import 'package:epilepsy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:marquee/marquee.dart';

import 'widgets/scrolling_text.dart';

class AddDrugScreen extends StatefulWidget {
  @override
  _AddDrugScreenState createState() => _AddDrugScreenState();
}

class _AddDrugScreenState extends State<AddDrugScreen> {
  final StartDrugController startDrugController =
      g.Get.find<StartDrugController>();
  final EndDrugController endDrugController = g.Get.find<EndDrugController>();

  final TextEditingController name = TextEditingController();
  final TextEditingController dosage = TextEditingController();
  final TextEditingController comment = TextEditingController();

  DateTime startTime;

  DateTime endTime;
  Dio dio = Dio();
  File _image;
  final picker = ImagePicker();
  _imgFromGallery() async {
    try {
      PickedFile pickedFile = await picker.getImage(
        source: ImageSource.gallery,
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

  @override
  void initState() {
    startTime = DateTime.now();
    endTime = DateTime.now();
    super.initState();
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
          title: 'Добавить лекрство',
          // title: 'Добавить лекрство',
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Text(
                        'Название лекарства',
                        style: TextStyles.drugCalendar,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 15.0,
                        ),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Введите название',
                        hintStyle: TextStyles.subTitle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Text(
                        'Дозировка',
                        style: TextStyles.drugCalendar,
                      ),
                    ),
                    TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Введите необходимую дозировку',
                        hintStyle: TextStyles.subTitle,
                      ),
                    ),
                    Column(children: [
                      GestureDetector(
                        onTap: _pickStartDate,
                        child: CustomListTile(
                          leading: AppIcons.accessMind,
                          subTitle: 'Дата начала',
                          title: DateFormat.yMMMd('ru').format(startTime),
                          // title: DateTime.now().toString(),
                        ),
                      ),
                      GestureDetector(
                        onTap: _pickEndDate,
                        child: CustomListTile(
                          leading: AppIcons.accessMind,
                          subTitle: 'Выбрать дату окончания',
                          title: DateFormat.yMMMd('ru').format(endTime),
                        ),
                      ),
                      GestureDetector(
                        onTap: _imgFromGallery,
                        child: CustomListTile(
                          leading: AppIcons.accessMind,
                          title: 'Прикрепить фото',
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
                    const SizedBox(height: 40.0),
                    Center(
                      child: Container(
                        width: 237.0,
                        height: 50.0,
                        margin: const EdgeInsets.only(bottom: 40.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            FormData formData = FormData.fromMap({
                              'title': name.text,
                              'dosage': dosage.text,
                              'date_start': startTime.toString(),
                              'date_end': endTime.toString(),
                              'comment': comment.text,
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
                              ApiUrls.addDrug,
                              data: formData,
                              options: Options(
                                headers: {
                                  HttpHeaders.authorizationHeader:
                                      'Bearer $token'
                                },
                              ),
                            );
                            if (response.statusCode == 200) {
                              print('okayy');
                            } else {
                              print('error in sending date to addDrug');
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
                          child:
                              Text('Сохранить', style: TextStyles.drugButton),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _pickStartDate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: startTime,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (date != null) {
      setState(() {
        startTime = date;
      });
      startDrugController.setStartDrugDate(date);
    }
  }

  _pickEndDate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: endTime,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (date != null) {
      setState(() {
        endTime = date;
      });
      endDrugController.setEndDrugDate(date);
    }
  }
}
