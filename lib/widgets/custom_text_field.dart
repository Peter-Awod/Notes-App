
import 'package:flutter/material.dart';

import '../shared/constants.dart';

class CustomTextField extends StatelessWidget
{
  String hintText;
  int maxLines;

  CustomTextField({super.key, required this.hintText, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:const TextStyle(
          color: kPrimaryColor,
          fontSize: 20,
        ),
        enabledBorder: buildOutlineInputBorder(color: kPrimaryColor),
        focusedBorder: buildOutlineInputBorder(color: kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({Color color = Colors.white}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}