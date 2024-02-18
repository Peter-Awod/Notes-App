import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNewNote extends StatelessWidget {
  const AddNewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(hintText: 'Title'),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(hintText: 'Content', maxLines: 5),
            const SizedBox(
              height: 100,
            ),
            const CustomButton(),
          ],
        ),
      ),
    );
  }
}