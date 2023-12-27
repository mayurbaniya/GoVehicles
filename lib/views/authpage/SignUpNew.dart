import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gov/services/SignUpAndOtpService.dart';
import 'package:gov/views/Components/authpagecomponents/LoginSignUpButton.dart';
import 'package:gov/views/Components/authpagecomponents/TextFieldsForLoginSignUpPages.dart';

class SignUpNew extends StatefulWidget {
  const SignUpNew({super.key});

  @override
  State<SignUpNew> createState() => _SignUpNewState();
}

class _SignUpNewState extends State<SignUpNew> {
  // global key
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final city = ['Nagpur', 'Bhandara', 'Wardha'];
  String? selectedCity;

  final gender = ['Male', 'Female'];
  String? selectedGender;

  final OtpService otpService = OtpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 245, 244, 244),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // heading
            Padding(
              padding: const EdgeInsets.only(top: 50),
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
                            style: TextStyle(color: Colors.black))
                      ])),
                ),
              ),
            ),

            // sub heading
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Let's create your Account",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),

            // textFields
            TextFieldsForLoginSignUpPages(
              controller: nameController,
              hintText: "name: eg. john doe",
              prefixIcon: Icons.person,
              fieldPadding: 5.0,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter your Name';
                }
                if (value.length < 2) {
                  return 'Really? who named you ${value.toLowerCase()}';
                }
              },
            ),
            TextFieldsForLoginSignUpPages(
              controller: emailController,
              hintText: "email",
              prefixIcon: Icons.email,
              fieldPadding: 5.0,
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
              controller: phoneController,
              inputLength: 10,
              hintText: "number",
              prefixIcon: Icons.phone,
              fieldPadding: 5.0,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter your number';
                }
                if (!RegExp(r'^[6789]\d{9}$').hasMatch(value)) {
                  return 'Not a valid number';
                }
                return null;
              },
            ),
            // drop down menu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Container(
                    width: Get.width * 0.42,
                    //  margin: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11)),
                    child: DropdownButtonHideUnderline(
                      child: InputDecorator(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FaIcon(
                                FontAwesomeIcons.locationArrow,
                                color: Color(0xFF595236),
                              ),
                            )),
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                errorBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                            value: selectedCity,
                            hint: Text('Your City'),
                            // isDense: true,
                            isExpanded: true,
                            items: city.map(buildMenuItems).toList(),
                            onChanged: (value) {
                              setState(() {
                                this.selectedCity = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Sselect City';
                              }
                            }),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Container(
                    width: Get.width * 0.42,
                    //  margin: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11)),
                    child: DropdownButtonHideUnderline(
                      child: InputDecorator(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FaIcon(
                                FontAwesomeIcons.person,
                                color: Color(0xFF595236),
                              ),
                            )),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              errorBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent))),
                          value: selectedGender,
                          hint: Text('Gender'),
                          // isDense: true,
                          isExpanded: true,
                          items: gender.map(buildMenuItemsGender).toList(),
                          onChanged: (value) {
                            setState(() {
                              this.selectedGender = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Select Gender';
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            TextFieldsForLoginSignUpPages(
              obscureText: true,
              hasSuffixIcon: true,
              suffixIcon: Icons.remove_red_eye,
              controller: passwordController,
              hintText: "password",
              prefixIcon: Icons.lock_person,
              fieldPadding: 5.0,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter a password';
                }
                ;
                if (value.length < 6) {
                  return 'Password should not be less than 6 characters';
                }
              },
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Text(
                      'By clicking on a submit, you agree to our',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [Text('Terms of service')],
                        ),
                        Column(
                          children: [Text('Privacy policy')],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            // Register button
            LoginSignUpButton(
              btnColor: Colors.black87,
              btnTitle: "SEND OTP",
              onTap: () {
                if (formKey.currentState!.validate()) {
                  otpService.sendOtp(
                      emailController.text.toLowerCase(),
                      nameController.text,
                      phoneController.text,
                      passwordController.text,
                      city,
                      gender.toString().toLowerCase(),
                      context);
                }
              },
            ),

            // or Register with

            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text('----- or Register with -----'),
              ),
            ),

            // google facebook
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        //  _showPopup('Facebook');
                      },
                      style: TextButton.styleFrom(
                        minimumSize: Size(155, 40),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.white70,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.facebook,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Facebook',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        // _showPopup('Google');
                      },
                      style: TextButton.styleFrom(
                          minimumSize: Size(155, 40),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.white70),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/icons/google.png'),
                            width: 20,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    // fontFamily: 'fontmain',
                                  ),
                                  children: <TextSpan>[
                                TextSpan(
                                    text: 'Go', style: TextStyle(fontSize: 12)),
                                TextSpan(
                                    text: 'og',
                                    style: TextStyle(color: Colors.redAccent)),
                                TextSpan(
                                    text: 'le',
                                    style: TextStyle(color: Colors.redAccent))
                              ])),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),

            // have an Account
            Expanded(
              child: InkWell(
                onTap: () {
                  Get.back();
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
                        TextSpan(text: 'Have an Account?'),
                        TextSpan(
                            text: ' Login',
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

  DropdownMenuItem<String> buildMenuItems(String city) => DropdownMenuItem(
        value: city,
        child: Text(
          city,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      );
  DropdownMenuItem<String> buildMenuItemsGender(String gender) =>
      DropdownMenuItem(
        value: gender,
        child: Text(
          gender,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      );
}
