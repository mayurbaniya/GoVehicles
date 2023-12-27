import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:gov/views/authpage/LoginNew.dart';

class LoginSignUpButton extends StatelessWidget {

  LoginNew loginNew = LoginNew();

  LoginSignUpButton({
    required this.btnColor,
    required this.btnTitle,
    required this.onTap,
    
  });

  final Color btnColor;
  final String btnTitle;
  final VoidCallback onTap;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: Get.width * 0.9,
          height: Get.height * 0.09,
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.all(Radius.circular(9)),
          ),
          child: Text(
            btnTitle,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

        ),
      ),
    );
  }
}
