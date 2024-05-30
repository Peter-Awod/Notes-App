import 'package:flutter/material.dart';

import 'custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
    this.icon2,
    this.onPressed2,
  });

  final String title;
  final IconData icon;
  final void Function()? onPressed;
  final IconData? icon2;
  final void Function()? onPressed2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 32, color: Colors.grey[600]),
        ),
        const Spacer(),
        if(icon2!=null)
        CustomIconButton(
          icon: icon2,
          onPressed: onPressed2,
        ),
        const SizedBox(
          width: 10,
        ),

        CustomIconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
