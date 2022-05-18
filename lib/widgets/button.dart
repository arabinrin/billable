import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  String? title;
  Color? color;
  Color? textcolor;
  IconData? icon;

  Button({
    required this.title,
    required this.color,
    required this.textcolor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title.toString(),
              style: TextStyle(
                color: textcolor,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          const  SizedBox(
              width: 10,
            ),
            Icon(icon, color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
