import 'package:flutter/material.dart';

import '../shared/constants.dart';

class CustomButton extends StatelessWidget

{
  const CustomButton({super.key, this.onPressed});
   final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(

      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      height: 50,
      color: kPrimaryColor,
      onPressed: onPressed,
      child: const Center(
        child: Text(
          'Add',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}