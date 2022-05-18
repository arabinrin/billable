import 'dart:async';

import 'package:billable/screens/Home.dart';
import 'package:billable/screens/auth/confirm.dart';
import 'package:billable/screens/auth/login.dart';
import 'package:billable/screens/auth/register.dart';
import 'package:billable/screens/mainhome.dart';
import 'package:billable/utils/constants/color.dart';
import 'package:billable/utils/constants/navigator.dart';
import 'package:billable/utils/get_storage.dart';
import 'package:billable/widgets/button.dart';
import 'package:billable/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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

  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();
  bool isAuthenticated = false;
  final storedPasscode = '1234';

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometric = true;
  List<BiometricType> _availableBiometric = [];
  String authorized = "Not authorized";

  Future<void> _checkBiometric() async {
    late bool canCheckBiometric;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  Future<void> _getAvailableBiometric() async {
    late List<BiometricType> availableBiometric;
    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    setState(() {
      _availableBiometric = availableBiometric;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: "Scan your finger to authenticate",

        // useErrorDialogs: true,
        // stickyAuth: false,
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      authorized = authenticated ? "Authorized" : " to authenticate";
      print(authorized);
      if (authenticated) {
        changeScreenReplacement(context, const MainHome());
      }
    });
  }

  @override
  void initState() {
    _checkBiometric();
    _getAvailableBiometric();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserToken>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Log in',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Welcome back.. We missed you!',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Color(0xff667085),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 80,
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
                    height: 10,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          ' Forget Password?',
                          style: TextStyle(
                            color: Color(0xff0551FB),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                if (auth.box.read('email') == email.text) {
                                  changeScreenReplacement(context, MainHome());
                                } else {
                                  final snackBar = SnackBar(
                                      content: Text('Wrong Information'));

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              } else {
                                final snackBar = SnackBar(
                                    content: Text('Input your login detail'));

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            child: Button(
                              title: 'Continue',
                              color: kblue,
                              textcolor: kwhite,
                            )),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      InkWell(
                        onTap: _authenticate,
                        child: Container(
                          height: 60.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffBACFFF),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: kprimarycolor, width: 1),
                          ),
                          child: Icon(
                            Icons.fingerprint,
                            size: 40.r,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    child: Center(
                      child: GestureDetector(
                        onTap: () async {
                          changeScreen(context, SignUp());
                        },
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0.sp,
                              color: Colors.black,
                            ),
                            children: [
                              const TextSpan(text: "Don’t have an account? "),
                              TextSpan(
                                text: "Create one",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  height: 32.r / 24.0.r,
                                  color: const Color(0xff0551FB),
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
