import 'dart:io';

import 'package:epilepsy/api/api_service.dart';
import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/controllers/seizure_activities_controller.dart';
import 'package:epilepsy/controllers/seizure_places_controller.dart';
import 'package:epilepsy/controllers/seizure_reasons_controller.dart';
import 'package:epilepsy/controllers/seizure_type_controller.dart';
import 'package:epilepsy/utils/Prefs.dart';
import 'package:epilepsy/utils/sizes.dart';
import 'package:epilepsy/widgets/access_dialog.dart';
import 'package:epilepsy/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:epilepsy/controllers/SeizuresController.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewAccessScreen extends StatefulWidget {
  @override
  _NewAccessScreenState createState() => _NewAccessScreenState();
}

class _NewAccessScreenState extends State<NewAccessScreen> {
  final Map<int, dynamic> accessData = {
    0: {
      'leading': AppIcons.accessCalendar,
      'subTitle': '13:30',
      // 'title': ,
      // 'title': 'Четверг январь 28.2021',
    },
    1: {
      'leading': AppIcons.accessClock,
      'subTitle': 'Длительность',
      'title': '00:27',
    },
    2: {
      'leading': AppIcons.accessMind,
      'subTitle': 'Вид припадка',
      'title': 'Название припадка',
    },
    3: {
      'leading': AppIcons.accessNote,
      'subTitle': 'Причина',
      'title': 'Добавить причину',
    },
    4: {
      'leading': AppIcons.accessRun,
      'subTitle': 'Активность',
      'title': 'Добавить активность',
    },
    5: {
      'leading': AppIcons.mark,
      'subTitle': 'Место',
      'title': 'Добавить место',
    },
  };

  final Map<int, dynamic> dialogData = {
    0: {
      'title': 'Абсанс',
      'isChecked': false,
    },
    1: {
      'title': 'Атонический',
      'isChecked': false,
    },
    2: {
      'title': 'Атонический абсанс',
      'isChecked': false,
    },
    3: {
      'title': 'Клоничесий',
      'isChecked': false,
    },
    4: {
      'title': 'Сложный парциальный',
      'isChecked': false,
    },
    5: {
      'title': 'Микологический',
      'isChecked': false,
    },
    6: {
      'title': 'Серийные миоклонические',
      'isChecked': false,
    },
  };

  DateTime dateTime = DateTime.now();
  DateTime dateWithTime = DateTime.now();
  String dateString;
  String hour, minute;
  Duration initialtimer = new Duration();
  String time;
  String mySeizureType;
  String mySizureReason;
  String mySizureActivity;
  String mySizurePlace;
  final token = Prefs.token ?? '';
  TextEditingController noteController = TextEditingController();
  final SeizureTypesController seizureTypeController =
      Get.find<SeizureTypesController>();
  final SeizureReasonsController seizureReasonsController =
      Get.find<SeizureReasonsController>();
  final SeizureActivitiesController seizureActivitiesController =
      Get.find<SeizureActivitiesController>();
  final SeizurePlacesController seizurePlacesController =
      Get.find<SeizurePlacesController>();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  @override
  void initState() {
    dateString = DateFormat.jm('ru').format(dateWithTime);
    seizureTypeController.fetchSeizureType();
    seizureReasonsController.fetchSeizureReason();
    seizurePlacesController.fetchSeizurePlace();
    seizureActivitiesController.fetchSeizureActivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mySeizureTypes = seizureTypeController.seizureTypeList;
    var mySeizureReasons = seizureReasonsController.seizureReasonList;
    var mySeizureActivities = seizureActivitiesController.seizureActivityList;
    var mySezurePlaces = seizurePlacesController.seizurePlacesList;
    // DateTime dateTime = DateTime.now();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(GetSize.width, 100.0),
        child: CustomAppBar(
          onTap: () => Get.back(),
          hasAction: false,
          leading: AppIcons.back,
          title: 'Новый приступ',
        ),
      ),
      body: Obx(() {
        // var data = seizureTypeController.seizureTypeList;
        // var data2 = seizureReasonsController.seizureReasonList;
        var data3 = seizureActivitiesController.seizureActivityList;
        var data4 = seizurePlacesController.seizurePlacesList;
        if (seizureTypeController.isLoading.value &&
            seizureReasonsController.isLoading.value &&
            seizureActivitiesController.isLoading.value &&
            seizurePlacesController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (
            // !seizureTypeController.isLoading.value &&
            //   // data == null &&
            // !seizureReasonsController.isLoading.value &&
            // data2 == null &&
            !seizureActivitiesController.isLoading.value &&
                data3 == null &&
                !seizurePlacesController.isLoading.value &&
                data4 == null) {
          Text('there is no data');
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //picking datetime
                      GestureDetector(
                        onTap: _pickDate,
                        child: CustomListTile(
                          leading: AppIcons.accessCalendar,
                          subTitle: dateString,
                          title: DateFormat.yMMMd('ru').format(dateTime),
                        ),
                      ),

                      //picking duration
                      GestureDetector(
                        onTap: () {
                          bottomSheet(context, timePicker());
                        },
                        child: CustomListTile(
                          leading: AppIcons.accessClock,
                          subTitle: 'Длительность',
                          title: _printDuration(initialtimer),
                          // title: initialtimer.toString(),
                        ),
                      ),
                      //type of seizur
                      GestureDetector(
                        onTap: () {
                          _showMaterialDialog(mySeizureTypes, 1);
                        },
                        child: CustomListTile(
                          leading: AppIcons.accessMind,
                          subTitle: 'Вид припадка',
                          title: mySeizureType == null || mySeizureType == ''
                              ? 'Название припадка'
                              : mySeizureType,
                        ),
                      ),
                      //reasons
                      GestureDetector(
                        onTap: () {
                          _showMaterialDialog(mySeizureReasons, 2);
                        },
                        child: CustomListTile(
                          leading: AppIcons.accessNote,
                          subTitle: 'Причина',
                          title: mySizureReason == null || mySizureReason == ''
                              ? 'Добавить причину'
                              : mySizureReason,
                        ),
                      ),
                      //activity

                      GestureDetector(
                        onTap: () {
                          _showMaterialDialog(mySeizureActivities, 3);
                        },
                        child: CustomListTile(
                          leading: AppIcons.accessRun,
                          subTitle: 'Активность',
                          title:
                              mySizureActivity == null || mySizureActivity == ''
                                  ? 'Добавить активность'
                                  : mySizureActivity,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _showMaterialDialog(mySezurePlaces, 4);
                        },
                        child: CustomListTile(
                          leading: AppIcons.mark,
                          subTitle: 'Место',
                          title: mySizurePlace == null || mySizurePlace == ''
                              ? 'Добавить место'
                              : mySizurePlace,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                        child: Text(
                          'Добавить примечание',
                          style: TextStyles.drugCalendar,
                        ),
                      ),
                      TextField(
                        controller: noteController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Palette.scaffoldBackgorund,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 15.0),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Примечание',
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
                              String myDate = DateFormat.yMd('ru')
                                      .format(dateTime)
                                      .toString() +
                                  ' ' +
                                  dateString;
                              String du = _printDuration(initialtimer);
                              print(myDate);
                              print(du);
                              await ApiService.storeSeizure(
                                // date: '01.01.2021 10:58:00',
                                date: myDate,

                                duration: du,
                                type: mySeizureType,
                                reason: mySizureReason,
                                activity: mySizureActivity,
                                place: mySizurePlace,
                                notes: noteController.text,
                              );
                              Get.back();
                            },
                            // onPressed: () async {
                            //   String myToooken = Prefs.token;
                            //   final headers = {
                            //     'Authorization': 'Bearer $token'
                            //   };
                            //   String myDate = dateString +
                            //       '' +
                            //       DateFormat.yMMMd('ru')
                            //           .format(dateTime)
                            //           .toString();
                            //   // var url = Uri.parse(
                            //   //     'http://api.cepi.xartcode.uz/seizures/store');
                            //   var url = Uri.parse(ApiUrls.seizureStore);
                            //   var response = await http.post(url, headers: {
                            //     HttpHeaders.authorizationHeader:
                            //         'Bearer $myToooken'
                            //   }, body: {
                            //     'date': '2021-13-07',

                            //     'duration': '00:32',
                            //     // 'duration': _printDuration(initialtimer),
                            //     'type': 'some type',
                            //     'reason': 'some reason',
                            //     'activity': 'some activity',
                            //     'place': 'some places',
                            //     'notice': 'my notice',

                            //     // 'date': '2021-13-07',
                            //     // // 'date': myDate,
                            //     // 'duration': '00:32',
                            //     // // 'duration': _printDuration(initialtimer),
                            //     // 'type': mySeizureType,
                            //     // 'reason': mySizureReason,
                            //     // 'activity': mySizureActivity,
                            //     // 'place': mySizurePlace,
                            //     // 'notice': noteController.text,
                            //   });
                            //   if (response.statusCode == 200) {
                            //     print('success in adding pristup');
                            //   } else {
                            //     print('error ${response.statusCode}');
                            //     print(response.reasonPhrase);
                            //   }
                            // },

                            // onPressed: () => accessDialog(dialogData),
                            style: ElevatedButton.styleFrom(
                              side:
                                  BorderSide(color: Palette.purple, width: 1.0),
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
              ),
            ],
          ),
        );
      }),
    );
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  // myChanger(String myStrings, String fromList) {
  //   setState(() {
  //     myStrings = fromList;
  //   });
  // }

  _showMaterialDialog(List myListToAccess, int indexSelection) {
    var myList = myListToAccess;
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              title: Center(
                  child: indexSelection == 1
                      ? Text('Вид припадка')
                      : indexSelection == 2
                          ? Text('Причина')
                          : indexSelection == 3
                              ? Text('Активность')
                              : Text('Место')),
              content: Container(
                height: 200,
                width: 300,
                child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: myList.length,
                    itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          switch (indexSelection) {
                            case 1:
                              setState(() {
                                mySeizureType = myList[index].title;
                              });
                              print(mySeizureType);
                              break;
                            case 2:
                              setState(() {
                                mySizureReason = myList[index].title;
                              });
                              print(mySizureReason);
                              break;
                            case 3:
                              setState(() {
                                mySizureActivity = myList[index].title;
                              });
                              print(mySizureActivity);
                              break;
                            case 4:
                              setState(() {
                                mySizurePlace = myList[index].title;
                              });
                              print(mySizurePlace);
                              break;
                          }
                          // myChanger(myTitle, myList[index].title);
                          // setState(() {
                          //   // mySeizureType = myList[index].title;
                          //   myTitle = myList[index].title;
                          // });
                          // print(myTitle);
                          Get.back();
                        },
                        child: Text(myList[index].title))),
              ),
              // actions: <Widget>[
              //   FlatButton(
              //     child: Text('Close me!'),
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //     },
              //   )
              // ],
            ));
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
      pickTime();
    }
  }

  pickTime() async {
    TimeOfDay pickedtime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedtime != null) {
      setState(() {
        hour = pickedtime.hour.toString();
        minute = pickedtime.minute.toString();
        dateString = hour + ':' + minute;
        // dateTime = date;
      });
    }
  }

  Widget timePicker() {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hms,
      minuteInterval: 1,
      secondInterval: 1,
      initialTimerDuration: initialtimer,
      onTimerDurationChanged: (Duration changedtimer) {
        setState(() {
          initialtimer = changedtimer;
          time = changedtimer.inHours.toString() +
              ' hrs ' +
              (changedtimer.inMinutes % 60).toString() +
              ' mins ' +
              (changedtimer.inSeconds % 60).toString() +
              ' secs';
        });
      },
    );
  }

  Future<void> bottomSheet(BuildContext context, Widget child,
      {double height}) {
    return showModalBottomSheet(
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13), topRight: Radius.circular(13))),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => Container(
            height: height ?? MediaQuery.of(context).size.height / 3,
            child: child));
  }
}
