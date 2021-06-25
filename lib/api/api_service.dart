import 'dart:convert';

import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/models/EEGApi.dart';
import 'package:epilepsy/models/models.dart';
import 'package:epilepsy/utils/Prefs.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();
  static final token = Prefs.token ?? '';
  static final headers = {'Authorization': 'Bearer $token'};

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
}
