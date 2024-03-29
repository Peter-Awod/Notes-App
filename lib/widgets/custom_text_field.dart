
import 'package:flutter/material.dart';

import '../shared/constants.dart';

class CustomTextField extends StatelessWidget
{
 final String hintText;
 final int maxLines;

 final void Function(String?)? onSaved;
 const CustomTextField({super.key, required this.hintText, this.maxLines = 1,this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'Field is required';
        }
        else {
          return null;
        }
      },
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