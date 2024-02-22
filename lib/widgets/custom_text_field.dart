
import 'package:flutter/material.dart';

import '../shared/constants.dart';

class CustomTextField extends StatelessWidget
{
 final String hintText;
 final int maxLines;

  const CustomTextField({super.key, required this.hintText, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: kPrimaryColor),
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.text,
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