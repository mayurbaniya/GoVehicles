import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gov/services/SignUpAndOtpService.dart';
import 'package:gov/views/authpage/Login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  bool isMale = true;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cnfpassword = TextEditingController();
  var gender;
  bool isLoading = false;
  bool showPass = true;

  final formkey = GlobalKey<FormState>();
  OtpService otpService = OtpService();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Stack(
          children: [
            // code for background image
            Positioned(
              top: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg_signup.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.03),
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.07),
                        child: Text(
                          "Let's create your account",
                          style: TextStyle(
                            fontFamily: 'fontmain',
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        )),
                  ],
                ),
              ),
            ),
            // main container textfields buttons etc
            Positioned(
                top: MediaQuery.of(context).size.height * 0.14,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5)
                      ]),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            print(value);
                          },
                          controller: username,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person_2_outlined),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'User Name'),
                          validator: (value) {
                            if (value!.isEmpty ||
                                value.length < 2 ||
                                !RegExp(r'^[a-z A-Z 0-9 _]+$')
                                    .hasMatch(value)) {
                              return 'Username should only have letters, spaces, and underscores.';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        TextFormField(
                          controller: email,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Email'),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,5}')
                                    .hasMatch(value)) {
                              return 'Invalid Email Address';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: number,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone_android_outlined),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Mobile number'),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[6789]\d{9}$').hasMatch(value)) {
                              return 'Not a valid number';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        TextField(
                          controller: city,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.location_city_outlined),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'City'),
                        ),
                        TextFormField(
                          controller: password,
                          obscureText: true,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline),
                              suffixIcon: showPass
                                  ? IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.remove_red_eye))
                                  : Icon(Icons.remove_red_eye_rounded),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'password'),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 6) {
                              return 'password must be at least 6 characters';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        TextFormField(
                          controller: cnfpassword,
                          obscureText: true,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline),
                              suffixIcon: Icon(Icons.remove_red_eye_outlined),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'confirm password'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter a confirm password';
                            }
                            if (password.text != cnfpassword.text) {
                              return 'password do not match';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        Container(
                          // color: Colors.green,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.015),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isMale = true;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      margin: EdgeInsets.only(right: 8),
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: isMale
                                            ? Colors.blueGrey
                                            : Colors.white,
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Icon(
                                        Icons.male,
                                        color: isMale
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text('Male'),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isMale = false;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      margin: EdgeInsets.only(right: 8),
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: isMale
                                            ? Colors.white
                                            : Colors.blueGrey,
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Icon(
                                        Icons.female,
                                        color: isMale
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                    Text('Female'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02),
                            child: Column(
                              children: [
                                Text(
                                  'By clicking on a continue, you agree to our',
                                  style: TextStyle(color: Colors.black45),
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
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.account_circle_sharp),
                                Text('Already have an Account?'),
                                Text(
                                  'Log In',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),

            // button part
            Positioned(
                top: MediaQuery.of(context).size.height - 190,
                right: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          Future.delayed(Duration(seconds: 20), () {
                            if (mounted) {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          });
                          otpService.sendOtp(
                              email.text.toString().trim(),
                              username.text.toString().trim(),
                              number.text.toString().trim(),
                              password.text.toString().trim(),
                              city.text.toString().trim(),
                              isMale,
                              context);
                        }
                      },
                      child: isLoading
                          ? SpinKitThreeBounce(
                              size: 22,
                              color: Colors.white,
                            )
                          : Text(
                              'continue',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                )),

            // facebook and google option
            Positioned(
                top: MediaQuery.of(context).size.height - 100,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Text('or Signup with'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            _showPopup('Facebook');
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size(155, 40),
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 66, 103, 178),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.facebook),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Facebook'),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            _showPopup('Google');
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size(155, 40),
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 219, 68, 55),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.circle_notifications_rounded),
                              SizedBox(
                                width: 5,
                              ),
                              Text('google'),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void _showPopup(String msg) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login with ${msg}'),
            content: Text("Sorry, We'll implement ${msg} login soon"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
}
