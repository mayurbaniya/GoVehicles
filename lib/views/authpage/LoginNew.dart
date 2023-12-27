import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gov/services/LoginService.dart';
import 'package:gov/views/Components/CustomDialogWidget.dart';
import 'package:gov/views/Components/authpagecomponents/LoginSignUpButton.dart';
import 'package:gov/views/Components/authpagecomponents/TextFieldsForLoginSignUpPages.dart';
import 'package:gov/views/authpage/SignUpNew.dart';

class LoginNew extends StatefulWidget {
  LoginNew({super.key});

  @override
  State<LoginNew> createState() => _LoginNewState();
}

class _LoginNewState extends State<LoginNew> {
  //global formkey
  final formkey = GlobalKey<FormState>();

  final loginService = LoginService();

  // text controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 247, 248, 245),
      // const Color.fromARGB(255, 245, 244, 244),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            // heading title

            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: Container(
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'fontmain',
                          ),
                          children: <TextSpan>[
                        TextSpan(text: 'Go', style: TextStyle(fontSize: 32)),
                        TextSpan(
                            text: 'Vehicles',
                            style: TextStyle(color: Colors.black87))
                      ])),
                ),
              ),
            ),

            // greetings

            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Container(
                child: const Text(
                  "Welcome back you've been missed",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),

            // re-usable text fields

            TextFieldsForLoginSignUpPages(
              controller: emailController,
              prefixIcon: Icons.email,
              hintText: "govehicles@mail.com",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,5}')
                    .hasMatch(value)) {
                  return 'Please Enter a valid email';
                }
                return null;
              },
            ),

            TextFieldsForLoginSignUpPages(
              controller: passwordController,
              prefixIcon: Icons.lock_person,
              obscureText: true,
              hintText: "•••••••••••",
              hasSuffixIcon: true,
              suffixIcon: Icons.remove_red_eye,
              suffixIconColor: Color(0xFF788154),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter your password';
                }
              },
            ),

            // forgot password
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: Get.width * 0.9,
                alignment: Alignment.bottomRight,
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),

            // continue button

            LoginSignUpButton(
              btnColor: Color(0xFF788154),
              btnTitle: "CONTINUE",
              onTap: () {
                if (formkey.currentState!.validate()) {
                  loginUser();
                  print('hello insed');

                  //  _showCustomDialog();
                }
                print('hello otsed if');
              },
            ),

            // --- or continue with ---

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Text('----- or continue with -----'),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: Get.width * 0.15,
                          // height: Get.height * 0.1,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 240, 239, 239),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              image:
                                  AssetImage('assets/images/icons/google.png'),
                              fit: BoxFit.cover,
                            ),
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: Get.width * 0.15,
                        // height: Get.height * 0.1,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 240, 239, 239),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image(
                          image: AssetImage('assets/images/icons/facebook.png'),
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: InkWell(
                onTap: () {
                  Get.to(SignUpNew(),
                      transition: Transition.cupertino,
                      duration: Duration(milliseconds: 1200));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          children: <TextSpan>[
                        TextSpan(text: 'Not a Member?'),
                        TextSpan(
                            text: ' Register now',
                            style: TextStyle(color: Colors.green))
                      ])),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future loginUser() async {
    print('calling getuserlogininfo method');

    await loginService.getUserLoginInfo(
        emailController.text.toLowerCase().trim(),
        passwordController.text.toLowerCase().trim(),
        context);

    // await Future.delayed(Duration(milliseconds: 5000));
  }
}
