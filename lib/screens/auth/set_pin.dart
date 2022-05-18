import 'package:billable/screens/auth/bvn_page.dart';
import 'package:billable/utils/constants/color.dart';
import 'package:billable/utils/constants/navigator.dart';
import 'package:billable/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetPin extends StatefulWidget {
  const SetPin({Key? key}) : super(key: key);

  @override
  State<SetPin> createState() => _SetPinState();
}

class _SetPinState extends State<SetPin> {
  TextEditingController pin = TextEditingController();
  bool valid = false;
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: TextStyle(
          fontSize: 30, color: Color(0xff0C0A40), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff0C0A40)),
        borderRadius: BorderRadius.circular(10.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Color(0xff0C0A40),
      ),
      borderRadius: BorderRadius.circular(10),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color(0xffE5EDFF),
      ),
    );
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 30.w,
                  height: 0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xff667085), width: 1),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 30.r,
                    ),
                  ),
                ),
              ],
            ),
             SizedBox(
              height: 50.h,
            ),
            Text(
              'Set your transaction PIN',
              style: GoogleFonts.poppins(
                textStyle:  TextStyle(
                    color: Colors.black,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w800),
              ),
            ),
             SizedBox(
              height: 20.h,
            ),
            Text(
              'Set a Safe Pin to authorize transactions on your account.',
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
                      'Step 3 of 5',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Color(0xff667085),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                     SizedBox(
                      height: 10.h,
                    ),
                    Stack(
                      children: [
                        Positioned(
                            child: Container(
                          height: 5,
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xffF5FCFF),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        )),
                        Positioned(
                            child: Container(
                          height: 5,
                          width: MediaQuery.of(context).size.width * .55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kprimarycolor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
             SizedBox(
              height: 50.h,
            ),
            Pinput(
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              onCompleted: (pin) {
                print(pin);
                changeScreen(
                    context,
                    ConfirmPin(
                      pin: pin,
                    ));
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              length: 4,
              controller: pin,
              validator: (val) {
                return val!.isEmpty || val.length != 4
                    ? "Please set a 4 digit PIN"
                    : null;
              },
            ),
             SizedBox(
              height: 100.h,
            ),
            GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      valid = true;
                    });
                    changeScreenReplacement(
                        context,
                        ConfirmPin(
                          pin: pin.text,
                        ));
                  } else {
                    final snackBar = SnackBar(content: Text('Bad Pin'));

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Button(
                  title: 'Confirm',
                  icon: Icons.arrow_circle_right,
                  color: kblue,
                  textcolor: kwhite,
                )),
          ],
        ),
      ),
    ))));
  }
}

class ConfirmPin extends StatefulWidget {
  const ConfirmPin({Key? key, required this.pin}) : super(key: key);
  final String pin;

  @override
  State<ConfirmPin> createState() => _ConfirmPinState();
}

class _ConfirmPinState extends State<ConfirmPin> {
  TextEditingController confirmPin = TextEditingController();
  bool valid = false;
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: TextStyle(
          fontSize: 30, color: Color(0xff0C0A40), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff0C0A40)),
        borderRadius: BorderRadius.circular(10.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Color(0xff0C0A40),
      ),
      borderRadius: BorderRadius.circular(10.r),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color(0xffE5EDFF),
      ),
    );
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
      padding: EdgeInsets.all(15.r),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 30.w,
                    height: 0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff667085), width: 1),
                    ),
                    child:  Center(
                      child: Icon(
                        Icons.arrow_circle_left_outlined,
                        size: 30.r,
                      ),
                    ),
                  ),
                ),
              ],
            ),
             SizedBox(
              height: 50.h,
            ),
            Text(
              'Confirm PIN',
              style: GoogleFonts.poppins(
                textStyle:  TextStyle(
                    color: Colors.black,
                    fontSize: 25.r,
                    fontWeight: FontWeight.w800),
              ),
            ),
             SizedBox(
              height: 20.h,
            ),
            Text(
              'Set a Safe Pin to authorize transactions on your account.',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: Color(0xff667085),
                    fontSize: 16,
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
                      'Step 3 of 5',
                      style: GoogleFonts.poppins(
                        textStyle:  TextStyle(
                            color: Color(0xff667085),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                     SizedBox(
                      height: 10.h,
                    ),
                    Stack(
                      children: [
                        Positioned(
                            child: Container(
                          height: 5,
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xffF5FCFF),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        )),
                        Positioned(
                            child: Container(
                          height: 5,
                          width: MediaQuery.of(context).size.width * .55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kprimarycolor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Pinput(
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              onCompleted: (pin) {
                if (pin == widget.pin) {
                  changeScreenReplacement(context, BVNpage());
                }
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              length: 4,
              controller: confirmPin,
              validator: (val) {
                return val!.isEmpty || val != widget.pin
                    ? "PIN must be matching"
                    : null;
              },
            ),
             SizedBox(
              height: 100.h,
            ),
            GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    if (confirmPin.text == widget.pin) {
                      changeScreenReplacement(context, BVNpage());
                    }
                  } else {
                    final snackBar =
                        SnackBar(content: Text('PIN must be matching'));

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Button(
                  title: 'Confirm PIN',
                  icon: Icons.arrow_circle_right,
                  color: kblue,
                  textcolor: kwhite,
                )),
          ],
        ),
      ),
    ))));
  }
}
