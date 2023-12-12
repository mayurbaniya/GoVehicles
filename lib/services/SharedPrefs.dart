import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static void storeData(http.Response response) async {
    Map<String, dynamic> userMap = jsonDecode(response.body);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userID', userMap['id']);
    prefs.setString('name', userMap['name']);
    prefs.setString('number', userMap['number']);
    prefs.setString('email', userMap['email']);
    prefs.setString('city', userMap['city']);
    prefs.setString('gender', userMap['gender']);
    prefs.setBool('loggedIn', true);

    print(
        'data from prefs: ${prefs.get('userID')}${prefs.get('name')}${prefs.get('number')}${prefs.get('email')}${prefs.get('city')}${prefs.get('gender')}');
  }
}
