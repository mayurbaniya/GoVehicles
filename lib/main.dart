import 'package:flutter/material.dart';
// import 'package:gov/splash.dart';
// import 'package:gov/views/authpage/Login.dart';
import 'package:gov/views/application/Home.dart';
import 'package:get/get.dart';
import 'package:gov/views/authpage/LoginNew.dart';

void main() {
  runApp(const MyApp());
}

bool isLightMode = true;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
