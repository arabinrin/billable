import 'package:billable/models/onboard.dart';
import 'package:billable/screens/auth/register.dart';
import 'package:billable/utils/constants/color.dart';
import 'package:billable/utils/constants/navigator.dart';
import 'package:billable/widgets/button.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B1 extends StatelessWidget {
  static const route = '/B1';
  B1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TheBoard(
      onBoardModel: onboardModels[0],
      current: 0,
      tap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
              opaque: true,
              transitionDuration: const Duration(milliseconds: 900),
              pageBuilder: (BuildContext context, _, __) {
                return B2();
              },
              transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              }),
        );
      },
    );
  }
}

class B2 extends StatelessWidget {
  static const route = '/B2';
  B2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TheBoard(
      onBoardModel: onboardModels[1],
      current: 1,
      tap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
              opaque: true,
              transitionDuration: const Duration(milliseconds: 900),
              pageBuilder: (BuildContext context, _, __) {
                return B3();
              },
              transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              }),
        );
      },
    );
  }
}

class B3 extends StatelessWidget {
  static const route = '/B2';
  B3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TheBoard(
      onBoardModel: onboardModels[2],
      current: 2,
      tap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
              opaque: true,
              transitionDuration: const Duration(milliseconds: 900),
              pageBuilder: (BuildContext context, _, __) {
                return B4();
              },
              transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              }),
        );
      },
    );
  }
}

class B4 extends StatelessWidget {
  static const route = '/B2';
  B4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TheBoard(
      onBoardModel: onboardModels[3],
      current: 3,
      tap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
              opaque: true,
              transitionDuration: const Duration(milliseconds: 900),
              pageBuilder: (BuildContext context, _, __) {
                return SignUp();
              },
              transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              }),
        );
      },
    );
  }
}

class TheBoard extends StatelessWidget {
  const TheBoard({
    Key? key,
    this.onBoardModel,
    this.tap,
    this.current,
  }) : super(key: key);

  final VoidCallback? tap;
  final int? current;
  final OnBoardModel? onBoardModel;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: tap,
          child: Container(
            padding: EdgeInsets.all(20),
            width: width,
            height: height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 80.w,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Color(0xff667085),
                              width: current != 3 ? 1 : 0),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              changeScreen(context, SignUp());
                            },
                            child: Text(current != 3?'Skip':'',
                                style: GoogleFonts.spaceGrotesk(
                                  textStyle: const TextStyle(
                                      color: Color(0xff667085),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: height * .5,
                    child: Image.asset(onBoardModel!.image),
                  ),
                  // const SizedBox(
                  //   height: 50,
                  // ),
                  Text(onBoardModel!.name,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: kblue,
                        ),
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    onBoardModel!.descr,
                    style: GoogleFonts.spaceGrotesk(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Color(0XFF667085),
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 100.w,
                    child: Row(
                      children:
                          List.generate(4, (index) => buildDot(index, context)),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  InkWell(
                      child: Button(
                    color: kblue,
                    textcolor: kwhite,
                    title: current == 3 ? 'Create an account' : 'Continue',
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 10,
      width: current == index ? 12.w : 10.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: current == index ? Color(0xff003566) : Color(0xffC4C4C4),
      ),
    );
  }
}
