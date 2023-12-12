import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gov/services/SharedPrefs.dart';
import 'package:gov/views/application/Home.dart';
import 'package:http/http.dart' as http;
import 'package:gov/API_URL.dart';

class LoginService {

  LoginService(){
    print('login service default constructor');

  }

  Future<void> getUserLoginInfo(String email, String password, BuildContext context) async{
    
    final Map<String, dynamic> data = {
        "email": email.trim(),
        "password": password.trim()
    };

    var url = Uri.parse("${API_URL.URL}/logincustomer");


    http.Response response = await http.post(
      url,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(data),
    );

    if(response.statusCode == 200){
     // print('response ${response.body}');
      SharedPrefs.storeData(response);
     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
      Get.off(Home(),transition: Transition.circularReveal , duration: Duration(seconds: 1));
    }if(response.statusCode == 404){
      print('response 404 : ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Account not found'))
      );
    }
  }

}