import 'package:flutter/material.dart';

import 'custom_icon.dart';

class CustomAppBar extends StatelessWidget {
 const CustomAppBar({super.key, required this.title, required this.icon});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style:
          TextStyle(
              fontSize: 32,
              color: Colors.white
          ),
        ),
        Spacer(),
        CustomSearchIcon(icon: icon),
      ],
    );
  }
}
