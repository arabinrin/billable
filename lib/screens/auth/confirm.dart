import 'package:billable/screens/auth/set_pin.dart';
import 'package:billable/utils/constants/color.dart';
import 'package:billable/utils/constants/navigator.dart';
import 'package:billable/widgets/button.dart';
import 'package:billable/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Confirm extends StatefulWidget {
  Confirm({Key? key, this.number}) : super(key: key);
  String? number;

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  TextEditingController code = TextEditingController();
  bool valid = false;
  static final formKey = GlobalKey<FormState>();

  RichText getRequiredLabel(String fieldName) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        text: fieldName,
        children: [TextSpan(text: ' *', style: TextStyle(color: Colors.red))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                        width: 30,
                        height: 0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Color(0xff667085), width: 1),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_circle_left_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Confirm your Number',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'We sent a verification code to the number you provided.',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Color(0xff667085),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Step 2 of 5',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Color(0xff667085),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
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
                                //   boxShadow:const [
                                //     BoxShadow(
                                //       color: Color(0xffF5FCFF),
                                //       spreadRadius: 2,
                                //       blurRadius: 2,
                                //       offset: Offset(
                                //           0, 3), // changes position of shadow
                                //     ),
                                //   ],
                                 ),
                              )),
                              Positioned(
                                  child: Container(
                                height: 5,
                                width: MediaQuery.of(context).size.width * .4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kprimarycolor,
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.grey.withOpacity(0.4),
                                  //     spreadRadius: 2,
                                  //     blurRadius: 2,
                                  //     offset: Offset(
                                  //         0, 3), // changes position of shadow
                                  //   ),
                                  // ],
                                ),
                              )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [getRequiredLabel('Number verification code:')],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Code',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  RoundedInputField(
                    textInputType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    obscure: true,
                    controller: code,
                    hintText: 'XXXX',
                    validator: (val) {
                      return val!.isEmpty || val.length != 6
                          ? "Enter 6 digit verification code"
                          : null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Enter the 6 digit code sent to ${widget.number}',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Color(0xff667085),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Center(
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Color(0xff0551FB),
                              ),
                              children: [
                                TextSpan(text: "Resend Code: "),
                                TextSpan(
                                  text: "59 sec",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                    height: 32 / 24.0,
                                    color: Color(0xff0551FB),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            valid = true;
                          });
                          changeScreenReplacement(context, SetPin());
                        } else {
                          final snackBar =
                              SnackBar(content: Text('Wrong code'));

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Button(
                        title: 'Next',
                        icon: Icons.arrow_circle_right,
                        color: kblue,
                        textcolor: kwhite,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
