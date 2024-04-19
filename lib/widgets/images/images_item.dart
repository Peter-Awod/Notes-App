import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  const ImageItem(
      {super.key, required this.isSelected, required this.selectedImage});

  final bool isSelected;
  final String selectedImage;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(width: 4, color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            width: 61,
            //radius: 20,
            child: Container(
              width: 60,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(selectedImage),
                ),
              ),
              //  radius: 18,
            ),
          )
        : Container(
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8),

              image: DecorationImage(fit: BoxFit.cover,
                image: AssetImage(selectedImage),
              ),
            ),
            //radius: 20,
          );
  }
}
