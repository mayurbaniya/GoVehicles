import 'package:flutter/material.dart';
import 'package:gov/views/application/Home.dart';
import 'package:gov/views/authpage/Login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Splash();
}

class _Splash extends State {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigator();
  }

  void _navigator() async {
    await Future.delayed(Duration(milliseconds: 1500));

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLoggedin = prefs.getBool('loggedIn');

    if (isLoggedin != null) {
      if (isLoggedin) {
        Get.off(Home(), transition: Transition.cupertinoDialog, duration: Duration(milliseconds: 1500));
      } else {
        Get.off(Login(), transition: Transition.fadeIn);
      }
    } else {
      Get.off(Login(), transition: Transition.fadeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        // color: Colors.greenAccent,
        decoration: BoxDecoration(
          color: Colors.white,
          // image: DecorationImage(
          //   // image: AssetImage('assets/images/splash/splashimg.jpg'),
          // )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Go Vehicles',
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'fontmain'),
            )
          ],
        ),
      ),
    );
  }
}
