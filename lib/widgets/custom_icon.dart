import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
   const CustomSearchIcon({super.key,required this.icon});

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.05),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
