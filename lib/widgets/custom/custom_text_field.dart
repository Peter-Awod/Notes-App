import 'package:flutter/material.dart';

import '../../shared/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final TextEditingController? textController;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      controller: textController,
      style:  TextStyle(color: Colors.grey[600]),
      cursorColor: kThemeColor,
      keyboardType: TextInputType.text,
      maxLines: maxLines,

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: kThemeColor,
          fontSize: 24,
        ),
        border: InputBorder.none,

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
