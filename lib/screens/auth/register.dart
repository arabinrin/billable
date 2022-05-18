import 'package:billable/screens/auth/confirm.dart';
import 'package:billable/screens/auth/login.dart';
import 'package:billable/utils/constants/color.dart';
import 'package:billable/utils/constants/navigator.dart';
import 'package:billable/utils/get_storage.dart';
import 'package:billable/widgets/button.dart';
import 'package:billable/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool rememberMe = false;

  void _onRememberMeChanged(bool? newValue) => setState(() {
        rememberMe = newValue!;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

  static final formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String phone = '';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  bool valid = false;
  bool _passwordVisible = false;

  RichText getRequiredLabel(String fieldName) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.poppins(
          textStyle: TextStyle(color: Colors.black, fontSize: 14),
        ),
        text: fieldName,
        children: [TextSpan(text: ' *', style: TextStyle(color: Colors.red))],
      ),
    );
  }

  signUp() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        valid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserToken>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.all(10.0.r),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Billed.jpg',
                    width: 124.w,
                    height: 100.h,
                  ),
                   SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Create an account',
                    style: GoogleFonts.poppins(
                      textStyle:  TextStyle(
                          color: Colors.black,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                   SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Kindly fill the form below, it would only take a moment.',
                    style: GoogleFonts.poppins(
                      textStyle:  TextStyle(
                          color: Color(0xff667085),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    textAlign: TextAlign.center,
                  ),
                   SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Step 1 of 5',
                            style: GoogleFonts.poppins(
                              textStyle:  TextStyle(
                                  color: Color(0xff667085),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                           SizedBox(
                            height: 10.sp,
                          ),
                          Stack(
                            children: [
                              Positioned(
                                  child: Container(
                                height: 5,
                                width: MediaQuery.of(context).size.width * .9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                              )),
                              Positioned(
                                  child: Container(
                                height: 5,
                                width: MediaQuery.of(context).size.width * .2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kprimarycolor,
                                ),
                              )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                   SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [getRequiredLabel('Full Name')],
                  ),
                  RoundedInputField(
                    controller: name,
                    hintText: 'Input your full name',
                    validator: (val) {
                      return val!.isEmpty || !val.contains(' ')
                          ? "Enter Full Name"
                          : null;
                    },
                  ),
                   SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [getRequiredLabel('Email address')],
                  ),
                  RoundedInputField(
                    controller: email,
                    hintText: 'Input your email address ',
                    validator: (val) {
                      return RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val!)
                          ? null
                          : "Enter correct email";
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [getRequiredLabel('Password')],
                  ),
                  RoundedInputField(
                    obscure: true,
                    controller: password,
                    hintText: 'Input your password',
                    validator: (val) {
                      return val!.isEmpty || val.length < 6
                          ? "Enter Password 6+ characters"
                          : null;
                    },
                  ),
                   SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [getRequiredLabel('Phone Number')],
                  ),
                  Container(
                    height: 75.h,
                    margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 0),
                    padding: EdgeInsets.symmetric(horizontal: 10..w),
                    decoration: BoxDecoration(
                      color: Color(0xffEEF1F3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: InternationalPhoneNumberInput(
                      hintText: '00 000 0000',
                      onInputChanged: (PhoneNumber number) {
                        phone = number.phoneNumber.toString();
                        print(" see ${phone}");
                      },
                      onInputValidated: (bool value) {},
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      // selectorTextStyle: TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: phoneController,
                      textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      searchBoxDecoration:
                          InputDecoration(fillColor: Color(0xffEEF1F3)),
                      autoFocus: false,
                      errorMessage: 'Invalid phone number',
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      // inputBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10.r),
                      // ),
                      onSaved: (PhoneNumber number) {
                        print('On Saved: ${phoneController.text}');
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: _onRememberMeChanged,
                      ),
                      Row(
                        children: [
                          Text(
                            'I accept the ',
                            style: TextStyle(
                              color: kLightGrey,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            ' terms of use',
                            style: TextStyle(
                              color: kprimarycolor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          Text(
                            ' and ',
                            style: TextStyle(
                              color: kLightGrey,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            ' privacy policy',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: kprimarycolor,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            valid = true;
                          });
                          await auth.box.erase;
                          auth.box.write('name', name.text);
                          auth.box.write('email', email.text);

                          changeScreenReplacement(
                              context,
                              Confirm(
                                number: phoneController.text,
                              ));
                        } else {
                          final snackBar =
                              SnackBar(content: Text('Wrong Information'));

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Button(
                        title: 'Continue',
                        color: valid ? kblue : Color(0xffE5EDFF),
                        textcolor: kwhite,
                        icon: Icons.arrow_circle_right,
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Center(
                      child: GestureDetector(
                        onTap: () async {
                          changeScreen(context, LogIn());
                        },
                        child: RichText(
                          text: TextSpan(
                            style:  TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14.0.sp,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(text: "Alreaady have an account? "),
                              TextSpan(
                                text: "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                  height: 32.sp / 24.0.sp,
                                  color: kprimarycolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
