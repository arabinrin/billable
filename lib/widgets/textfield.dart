import 'package:billable/utils/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final Widget? icon;
  final double? width;
  final IconData? icon2;
  void Function(String?)? onSaved;
  List<TextInputFormatter>? inputFormatters;

  final String? Function(String?)? validator;
  bool obscure;
  TextInputType? textInputType;

  TextEditingController? controller;
  RoundedInputField(
      {required this.controller,
      required this.hintText,
      this.icon2,
          this.width = .9,

      this.textInputType,
      this.icon,
      this.obscure = false,
      this.inputFormatters,
      this.onSaved,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator,
        obscureText: obscure,
        // onChanged: onChanged,
        cursorColor: kprimarycolor,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintStyle: GoogleFonts.spaceGrotesk(
            textStyle: const TextStyle(
              color: Color(0xff667085),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          suffixIcon: Icon(
            icon2,
            color: Colors.grey,
            size: 18,
          ),
          // icon: Icon(
          //   icon,
          //   color: Colors.grey,
          //   size: 18,
          // ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  double wide;
  TextFieldContainer({
    required this.child,
    this.wide = .9,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xffEEF1F3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}
