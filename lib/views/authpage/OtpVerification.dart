import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gov/services/SignUpAndOtpService.dart';

class OtpVerification extends StatefulWidget {
  //const OtpVerification({super.key});

  var email;
  OtpVerification(var email) {
    this.email = email;

    // print('mail: ${email.toString()} pass: ${password.toString()} username ${username.toString()} city ${city.toString()} gender ${gender.toString()}  ');
  }

  @override
  State<OtpVerification> createState() =>
      _OtpVerificationState(email.toString());
}

class _OtpVerificationState extends State<OtpVerification> {
  String? maskedemail;

  _OtpVerificationState(String email) {
    maskedEmail(email);
  }

  OtpService otpService = OtpService();

  //global form key
  final formKey = GlobalKey<FormState>();

  // saving otp
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();

  Timer? timer;
  int _secondsRemaining = 20;

  void maskedEmail(String email) {
    List<String> parts = email.split('@');
    String maskedUsername = parts[0]
        .replaceRange(1, parts[0].length - 1, '*' * (parts[0].length - 2));
    maskedemail = maskedUsername + '@' + parts[1];
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        if (mounted) {
          setState(() {
            _secondsRemaining--;
            // print(_secondsRemaining);
          });
        }
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        // alignment: AlignmentDirectional.topStart,
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verification code",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),

              Text(
                "We have sent the verification code to",
                style: TextStyle(color: Colors.grey),
              ),

              // email

              Row(
                children: [
                  Text(
                    '$maskedemail',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 54, 45, 45),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('tapped');
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Change your mail?",
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),

              //textfields
              Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        height: 50,
                        width: 50,
                        child: TextFormField(
                          controller: otp1,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.length == 0) {
                              FocusScope.of(context).unfocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 28),
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '*';
                            }
                          },
                        )),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        height: 50,
                        width: 50,
                        child: TextFormField(
                          controller: otp2,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.length == 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 28),
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '*';
                            }
                          },
                        )),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        height: 50,
                        width: 50,
                        child: TextFormField(
                          controller: otp3,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.length == 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 28),
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '*';
                            }
                          },
                        )),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        height: 50,
                        width: 50,
                        child: TextFormField(
                          controller: otp4,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).unfocus();
                            }
                            if (value.length == 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 28),
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '*';
                            }
                          },
                        )),
                  ],
                ),
              ),

              Expanded(
                  flex: 1,
                  child: Center(
                      child: Text("Resend code after $_secondsRemaining"))),

              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _secondsRemaining != 0
                                ? showToastMessage()
                                : print("hwllo");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                width: 2,
                                color: _secondsRemaining != 0
                                    ? Colors.grey
                                    : Colors.black,
                              ),
                            ),
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: Center(
                                child: Text(
                              'Resend ${_secondsRemaining != 0 ? _secondsRemaining : ""}',
                              style: TextStyle(
                                  color: _secondsRemaining != 0
                                      ? Colors.grey
                                      : Colors.redAccent,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              otpService.verifyOtp(
                                  "${otp1.text}${otp2.text}${otp3.text}${otp4.text}",
                                  context);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(11),
                            ),
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: Center(
                                child: Text(
                              'Submit',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showToastMessage() {
    Fluttertoast.showToast(
      msg: "Please wait ${_secondsRemaining}",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
    );
  }
}
