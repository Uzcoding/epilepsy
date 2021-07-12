import 'dart:convert';

import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/models/EEGApi.dart';
import 'package:epilepsy/models/drug_list_api.dart';
import 'package:epilepsy/models/models.dart';
import 'package:epilepsy/models/seizure_type.dart';
import 'package:epilepsy/models/seizures.dart';
import 'package:epilepsy/utils/Prefs.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();
  static final token = Prefs.token ?? '';
  static final headers2 = {
    'Authorization': 'Bearer $token',
    'Accept': 'application/json'
  };
  static final headers = {'Authorization': 'Bearer $token'};

  //Seizure store

  static Future storeSeizure(
      {String date,
      String duration,
      String type,
      String reason,
      String activity,
      String place,
      String notes}) async {
    var url = Uri.parse(ApiUrls.seizureStore);
    try {
      var response = await client.post(url, headers: headers2, body: {
        'date': date,

        'duration': duration,
        // 'duration': _printDuration(initialtimer),
        'type': type,
        'reason': reason,
        'activity': activity,
        'place': place,
        'notice': notes,
      });
      print(response.body);
      if (response.statusCode == 200) {
        print('success in store');
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('Request failed with error: $e.');
    }
  }
  //Seizure Types

  static Future<SeizureTypeModel> fetchSeizureType() async {
    var url = Uri.parse(ApiUrls.seizureTypes);
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return SeizureTypeModel.fromJson(json.decode(jsonString));
      }
      print('Request failed with status: ${response.statusCode}.');
      return null;
    } catch (e) {
      print('Request failed with error: $e.');
      return null;
    }
  }

  //Seizure Reasones

  static Future<SeizureTypeModel> fetchSeizureReasons() async {
    var url = Uri.parse(ApiUrls.seizureReasons);
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return SeizureTypeModel.fromJson(json.decode(jsonString));
      }
      print('Request failed with status: ${response.statusCode}.');
      return null;
    } catch (e) {
      print('Request failed with error: $e.');
      return null;
    }
  }
  //Seizure Placees

  static Future<SeizureTypeModel> fetchSeizurePlaces() async {
    var url = Uri.parse(ApiUrls.seizurePlaces);
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return SeizureTypeModel.fromJson(json.decode(jsonString));
      }
      print('Request failed with status: ${response.statusCode}.');
      return null;
    } catch (e) {
      print('Request failed with error: $e.');
      return null;
    }
  }
  //Seizure Activities

  static Future<SeizureTypeModel> fetchSeizureActivities() async {
    var url = Uri.parse(ApiUrls.seizureActivities);
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return SeizureTypeModel.fromJson(json.decode(jsonString));
      }
      print('Request failed with status: ${response.statusCode}.');
      return null;
    } catch (e) {
      print('Request failed with error: $e.');
      return null;
    }
  }

  //Seizure Store

  //EEG API

  static Future<EEGApi> fetchEEG() async {
    var url = Uri.parse(ApiUrls.eeg);
    try {
      var response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return EEGApi.fromJson(json.decode(jsonString));
      }
      print('Request failed with status: ${response.statusCode}.');
      return null;
    } catch (e) {
      print('Request failed with error: $e.');
      return null;
    }
  }

  //Drugs
  static Future<DrugListApi> fetchdrugs() async {
    var url = Uri.parse(ApiUrls.drugs);
    try {
      var response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print('success in druglist api');
        return DrugListApi.fromJson(json.decode(jsonString));
      }
      print('Request failed with status: ${response.statusCode}.');
      return null;
    } catch (e) {
      print('Request failed with error: $e.');
      return null;
    }
  }

  //News
  static Future<NewsApi> fetchNews() async {
    var url = Uri.parse(ApiUrls.news);
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return NewsApi.fromJson(json.decode(jsonString));
      }
      print('Request failed with status: ${response.statusCode}.');
      return null;
    } catch (e) {
      print('Request failed with error: $e.');
      return null;
    }
  }

  static Future<FAQApi> fetchFAQs() async {
    var url = Uri.parse(ApiUrls.faq);
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return FAQApi.fromJson(json.decode(jsonString));
      }
      print('Request failed with status: ${response.statusCode}.');
      return null;
    } catch (e) {
      print('Request failed with error: $e.');
      return null;
    }
  }

  static Future<FAQApi> fetchContacts() async {
    var url = Uri.parse(ApiUrls.faq);
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return FAQApi.fromJson(json.decode(jsonString));
      }
      print('Request failed with status: ${response.statusCode}.');
      return null;
    } catch (e) {
      print('Request failed with error: $e.');
      return null;
    }
  }

  // Auth

  static Future<LoginApi> login(String phoneNumber) async {
    var url = Uri.parse(ApiUrls.login);
    try {
      var response = await client.post(
        url,
        body: {'phone': phoneNumber},
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return LoginApi.fromJson(json.decode(jsonString));
      }
      print('Request failed with status: ${response.statusCode}.');
      return null;
    } catch (e) {
      print('Request failed with error: $e.');
      return null;
    }
  }

  static Future<LoginVerifyApi> verify(
    int userId, {
    @required String code,
    String fcmToken = '',
  }) async {
    var url = Uri.parse('${ApiUrls.verify}$userId');
    print(url);
    try {
      var response = await client.put(
        url,
        body: {
          'code': code,
          'fcm_token': fcmToken,
        },
      );
      if (response.statusCode == 201) {
        var jsonString = response.body;
        return LoginVerifyApi.fromJson(json.decode(jsonString));
      }
      print('Request failed with status: ${response.statusCode}.');
      print(response.body);
      return null;
    } catch (e) {
      print('Request failed with error: $e.');
      return null;
    }
  }

  static Future logOut(int userId) async {
    var url = Uri.parse('${ApiUrls.logOut}$userId');
    try {
      var response = await client.post(url, headers: headers);
      print(response);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
      }
    } catch (e) {
      print('Request failed with error: $e.');
    }
  }

  static Future<ProfileApi> fetchProfile() async {
    var url = Uri.parse(ApiUrls.profile);
    try {
      var response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return ProfileApi.fromJson(json.decode(jsonString));
      }
      print('Request failed with status: ${response.statusCode}.');
      return null;
    } catch (e) {
      print('Request failed with error: $e.');
      return null;
    }
  }

  static Future<SeizuresApi> fetchSeizuresByDate(String date) async {
    var url = Uri.parse('${ApiUrls.seizuresByDate}$date');
    try {
      var response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return SeizuresApi.fromJson(json.decode(jsonString));
      }
      print('Request failed with status: ${response.statusCode}.');
      return null;
    } catch (e) {
      print('Request failed with error: $e.');
      return null;
    }
  }
}
