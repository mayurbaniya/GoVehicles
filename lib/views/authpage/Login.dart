import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gov/services/LoginService.dart';
import 'package:gov/views/authpage/SignUp.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  Login() {}

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  //formkey
  final formkey = GlobalKey<FormState>();
  //other
  bool isLoading = false;

  void loginServiceMethod() {
    var loginService = LoginService();
    var userLoginInfo =
        loginService.getUserLoginInfo(email.text, password.text, context);
    isLoading = false;
    print(isLoading);
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Form(
          key: formkey,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_login.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                // heading title
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.07),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome ',
                        style: TextStyle(
                            fontFamily: 'fontmain',
                            fontSize: 32,
                            color: Colors.black),
                      ),
                      Text(
                        'back ',
                        style: TextStyle(
                            fontFamily: 'fontmain',
                            fontSize: 28,
                            color: Colors.red),
                      ),
                    ],
                  ),
                ),

                // text fields
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: email,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: 'govehicles@gmail.com',
                                hintStyle: TextStyle(color: Colors.grey),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                            style: TextStyle(fontSize: 22),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter a Email';
                              }
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,5}')
                                  .hasMatch(value)) {
                                return 'please Enter a valid mail';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: password,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: '************',
                                hintStyle: TextStyle(color: Colors.grey),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                            style: TextStyle(fontSize: 22),
                            obscureText: true,
                            validator: (value) {
                              
                              if (value!.isEmpty) {
                                return 'please Enter a password';
                              }
                              if (value.length < 6) {
                                return 'Not a Valid password, Did you forgot it? try forgot password option';
                              }
                            },
                          ),
                        ],
                      )),
                ),

                // button part

                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          loginServiceMethod();
                          setState(() {
                            isLoading = true;
                          });
                        }
                        Future.delayed(Duration(seconds: 5), () {
                          if (mounted) {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        });
                      },
                      child: isLoading
                          ? SpinKitThreeBounce(
                              size: 22,
                              color: Colors.redAccent,
                            )
                          : Text(
                              'continue',
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 18),
                            )),
                ),

                // policy and sign up boutton container

                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                      bottom: MediaQuery.of(context).size.height * 0.05),
                  child: Column(children: [
                    GestureDetector(
                      onTap: () {
                        print('create account tapped');
                        Get.to(()=> SignUp(), transition: Transition.circularReveal, duration: Duration(milliseconds: 1000) );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_3_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            'Create an Account',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    Text(
                      'By clicking on a continue, you agree to our',
                      style: TextStyle(color: Colors.white70),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Terms of service'),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Privacy policy')
                      ],
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
