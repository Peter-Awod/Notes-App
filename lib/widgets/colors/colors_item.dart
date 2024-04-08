import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.selectedColor});
  final bool isSelected;
  final Color selectedColor;
  @override
  Widget build(BuildContext context) {
    return isSelected?  CircleAvatar(
      backgroundColor: Colors.white,
      radius: 20,
      child: CircleAvatar(
        backgroundColor:selectedColor,
        radius: 18,
      ),
    ) :  CircleAvatar(
      backgroundColor: selectedColor,
      radius: 20,
    ) ;
  }
}
