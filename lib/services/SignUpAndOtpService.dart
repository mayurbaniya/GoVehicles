import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:gov/API_URL.dart';
import 'package:gov/services/SharedPrefs.dart';
import 'package:gov/views/Components/CustomDialogWidget.dart';
import 'package:gov/views/application/Home.dart';
import 'package:gov/views/authpage/Login.dart';
import 'package:gov/views/authpage/LoginNew.dart';
import 'package:gov/views/authpage/OtpVerification.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class OtpService {
  OtpService() {}

  // --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>> sendint OTP

  Future<void> sendOtp(email, username, number, password, city, gender,
      BuildContext context) async {

        showDialog(context: context,
         builder: (context){
            return Center(
                child: SpinKitWave(color: Colors.green, size: 22,),
            );
         });


    final Map<String, dynamic> data = {
      "name": username.toString().trim(),
      "email": email.toString().trim(),
      "city": city.toString().trim(),
      "password": password.toString().trim(),
      "gender": gender.toString().trim(),
      "number": number.toString().trim()
    };

    var url = Uri.parse('${API_URL.URL}/getdata');
    print('url: $url');

    try{

    http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      Get.off(()=>OtpVerification(email), transition: Transition.cupertino);
    } 
    if (response.statusCode == 302) {
      Get.back();
      _showPopup(email, response.body.toString(), context);
    }
    if (response.statusCode == 500) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Column(
        children: [
          Text('Something went wrong on a server'),
          Text('You can try again later'),
        ],
      )));
    }
    if (response.statusCode == 400) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Column(
        children: [
          Text('INVALID EMAIL ADDRESS'),
          Text('PLEASE CHECK YOUR EMAIL'),
        ],
      )));
    }
    }catch(e){

          if(e is SocketException && e.osError?.errorCode == 110){
              Get.back(); 
             _showCustomDialog('Server Down', Icons.warning_amber_outlined,
            'Connection can\'t be made, something wrong with the server, Sorry! Please try again later');
          }
    }
  }

  // ------------------------>>>>>>>>>>>> verifying OTP

  Future<void> verifyOtp(String otp, BuildContext context) async {
    try {
      var url = Uri.parse("${API_URL.URL}/verify/$otp");

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        print(response.body);
        SharedPrefs.storeData(response);
          Get.offAll(Home(),transition: Transition.circularReveal);
      }
      if (response.statusCode == 401) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid OTP')));
      }
    } catch (e) {
        _showCustomDialog('Server Down', Icons.warning_amber, 
        'Connection can\'t be made, something wrong with the server, Sorry! Please try again later');
    }
  }


    // popup

  void _showPopup(String email, String name, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.faceSadCry, color: Colors.redAccent,
                ),
                SizedBox(
                  width: 15,
                ),
                Text('Account Exists', style: TextStyle(color: Colors.redAccent),),
              ],
            ),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text('The'),
                      Text(
                        ' mail address ',
                        style: TextStyle(color: Colors.blue),
                      ),
                      Text('you entered is already'),
                    ],
                  ),
                  Text('associated with an existing account'),
                  SizedBox(
                    height: 20,
                  ),
                  Text('please choose a different email address'),
                  Row(
                    children: [
                      Text('or try'),
                      Text(
                        ' logging in ',
                        style: TextStyle(color: Colors.blue),
                      ),
                      Text('if this is your account')
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.email_rounded),
                      Text(' email: '),
                      Text(
                        '$email',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.verified_user_sharp),
                      Text(' username: '),
                      Text(
                        '$name',
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              FilledButton.tonal(
                  onPressed: () {
                   Get.offAll(()=>LoginNew(), transition: Transition.circularReveal ,duration: Duration(seconds: 1));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.userAstronaut),
                      SizedBox(
                        width: 10,
                      ),
                      Text('login'),
                    ],
                  )),
              FilledButton.tonal(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.userNinja),
                      SizedBox(
                        width: 10,
                      ),
                      Text('signup(with diff email)'),
                    ],
                  )),
            ],
          );
        });
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
