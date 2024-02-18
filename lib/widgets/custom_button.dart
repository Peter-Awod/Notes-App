import 'package:flutter/material.dart';

import '../shared/constants.dart';

class CustomButton extends StatelessWidget

{
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      height: 50,
      color: kPrimaryColor,
      onPressed: () {},
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