
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(8.0),
      child:  Column(
        children: [
          SizedBox(
            height: 40,
          ),
          CustomAppBar(title: 'Edit Note', icon: Icons.check_outlined),
          SizedBox(
            height: 32,
          ),
          CustomTextField(
            hintText: 'Title',
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: CustomTextField(hintText: 'Content', maxLines: 1000),
          ),
        ],
      ),
    );
  }
}