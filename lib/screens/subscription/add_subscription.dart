import 'package:billable/widgets/button.dart';
import 'package:billable/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddSubscription extends StatefulWidget {
  const AddSubscription({Key? key}) : super(key: key);

  @override
  State<AddSubscription> createState() => _AddSubscriptionState();
}

class _AddSubscriptionState extends State<AddSubscription> {
  TextEditingController billName = TextEditingController();
  TextEditingController category = TextEditingController();
  int formScreem = 0;
  List<Widget> formScreens = [
    FormScreen(),
    FormScreen2(),
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height,
                    width: width,
                  ),
                  Positioned(
                    top: 0.h,
                    child: Container(
                      height: 400.h,
                      width: width,
                      child: SingleChildScrollView(
                        //     controller: controller,

                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              height: 250.h,
                              width: width,
                              color: Color(0xff0c0a40),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.arrow_back_ios_outlined,
                                          color: Colors.white,
                                          size: 25.sp,
                                        ),
                                      ),
                                      Text(
                                        'Payment',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Icon(
                                        Icons.notification_add_outlined,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    'Fill the available fields to create a subscription plan',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 170.h,
                    right: 15,
                    child: formScreens[formScreem],
                  ),
                  Positioned(
                    bottom: 150.h,
                    left: 15.h,
                    child: Container(
                      height: 70.h,
                      width: width - 30.h,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            formScreem += 1;
                          });
                        },
                        child: Button(
                          color: Color(0xff0c0a40),
                          title: 'Next',
                          textcolor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FormScreen extends StatelessWidget {
  FormScreen({
    Key? key,
  }) : super(key: key);

  final TextEditingController billName = TextEditingController();
  final TextEditingController category = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(15.r),
      height: 230.h,
      width: width - 32,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3,
            // spreadRadius: 3,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Name',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          RoundedInputField(
              controller: billName, hintText: 'Input name of bill'),
          Row(
            children: [
              Text(
                'Category',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          RoundedInputField(
              controller: category, hintText: 'Input a category name'),
        ],
      ),
    );
  }
}

class FormScreen2 extends StatelessWidget {
  FormScreen2({
    Key? key,
  }) : super(key: key);

  final TextEditingController biller = TextEditingController();
  final TextEditingController product = TextEditingController();
  final TextEditingController customerId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(15.r),
      height: 320.h,
      width: width - 32,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3,
            // spreadRadius: 3,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Biller',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          RoundedInputField(controller: biller, hintText: 'Select biller'),
          Row(
            children: [
              Text(
                'Product',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          RoundedInputField(controller: product, hintText: 'Select Product'),
          Row(
            children: [
              Text(
                'Customer ID',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          RoundedInputField(
              controller: customerId, hintText: 'Input Customer ID'),
        ],
      ),
    );
  }
}
