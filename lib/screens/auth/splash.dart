import 'package:billable/utils/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding:  EdgeInsets.all(20.0.r),
          child: Center(
            child:
            
                Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: kblue),
              padding: EdgeInsets.all(20.r),
              child: Image.asset(
                'assets/Billed.jpg',
                width: 124.w,
                height: 125.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
