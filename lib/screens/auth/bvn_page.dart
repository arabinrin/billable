import 'package:billable/screens/auth/add_card.dart';
import 'package:billable/utils/constants/color.dart';
import 'package:billable/utils/constants/navigator.dart';
import 'package:billable/widgets/button.dart';
import 'package:billable/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BVNpage extends StatelessWidget {
  BVNpage({Key? key}) : super(key: key);
  TextEditingController code = TextEditingController();
  bool valid = false;
  static final formKey = GlobalKey<FormState>();

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
                  height: 30,
                
                  child: Center(
                    child: Image.asset('assets/arrow.png',color: Colors.black,height: 30,width: 30,scale: 2,),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Verify your BVN',
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
              'Reason we need your BVN is to have access to your : ',
              style: GoogleFonts.spaceGrotesk(
                textStyle: const TextStyle(
                    color: Color(0xff667085),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '- Full name',
                      style: GoogleFonts.spaceGrotesk(
                        textStyle: const TextStyle(
                            color: Color(0xff667085),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '- Phone Number',
                      style: GoogleFonts.spaceGrotesk(
                        textStyle: const TextStyle(
                            color: Color(0xff667085),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '- Date of Birth ',
                      style: GoogleFonts.spaceGrotesk(
                        textStyle: const TextStyle(
                            color: Color(0xff667085),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
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
                              'Step 4 of 5',
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
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0xffF5FCFF),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                )),
                                Positioned(
                                    child: Container(
                                  height: 5,
                                  width:
                                      MediaQuery.of(context).size.width * .75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: kprimarycolor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(
                                            0, 1), // changes position of shadow
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
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Bank Verification Number',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            RoundedInputField(
              textInputType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              obscure: true,
              controller: code,
              hintText: 'Enter BVN',
              validator: (val) {
                return val!.isEmpty || val.length < 10
                    ? "Enter an 11 digits BVN"
                    : null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'text *560*1# on your mobile phone to get your BVN sent to you.',
              style: GoogleFonts.spaceGrotesk(
                textStyle: const TextStyle(
                    color: Color(0xff667085),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 80,
            ),
            GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    changeScreenReplacement(context, AddCard());
                  } else {
                    final snackBar =
                        SnackBar(content: Text('Enter an 11 digits BVN'));

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
    ))));
  }
}
