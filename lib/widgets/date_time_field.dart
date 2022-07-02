import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class BasicDateField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String? Function(DateTime?)? validator;

  const BasicDateField({
    Key? key,
    required this.controller, required this.title, this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("yyyy-MM-dd");
    return Column(children: <Widget>[
      Text(title,style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),),
      DateTimeField(
        controller: controller,
        format: format,
        validator: validator,
        decoration: const InputDecoration(
          fillColor: Color.fromRGBO(238, 241, 243, 1),
            filled: true,
            hintText: "yyy/MM/DD",
            suffixIcon: Icon(Icons.calendar_month_outlined),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.white)
          ),
        ),
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}
