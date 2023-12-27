import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:gov/services/SharedPrefs.dart';
import 'package:gov/views/Components/CustomDialogWidget.dart';
import 'package:gov/views/application/Home.dart';
import 'package:http/http.dart' as http;
import 'package:gov/API_URL.dart';

class LoginService {
  LoginService() {
    print('login service default constructor');
  }

  Future getUserLoginInfo(
      String email, String password, BuildContext context) async {
    print('email : $email and password $password');

    // showing loading
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
            child: SpinKitWave(
              color: Colors.green,
              size: 24,
            ),
          );
        });

    final Map<String, dynamic> data = {
      "email": email.trim(),
      "password": password.trim()
    };

    var url = Uri.parse("${API_URL.URL}/logincustomer");
    print(url);

    try {
      http.Response response = await http.post(
        url,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // print('response ${response.body}');
        SharedPrefs.storeData(response);
        Get.back();
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
        Get.off(Home(),
            transition: Transition.circularReveal,
            duration: Duration(seconds: 1));
      }
      if (response.statusCode == 404) {
        Get.back();
        print('response 404 : ${response.body}');

        _showCustomDialog('Account not found', Icons.no_accounts_rounded,
        'There\'s no Account found in our database with the provided email & password combination, please try again or create new accound');
      }
    } catch (e) {
      if (e is SocketException && e.osError?.errorCode == 110) {
        print(' e is socket exception block');
        Get.back();
        _showCustomDialog('Server Down', Icons.warning_amber_outlined,
            'Connection can\'t be made, something wrong with the server, Sorry! Please try again later');
      }
    }
  }

  void _showCustomDialog(String title, IconData icon, String content) {
    Get.dialog(
      CustomDialogWidget(
        dialogTitle: title,
        mainIcon: icon,
        dialogContent: content,
      ),
    );
  }
}
