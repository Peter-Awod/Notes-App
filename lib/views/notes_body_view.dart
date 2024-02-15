import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';

class NotesBodyView extends StatelessWidget {
  const NotesBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column (
        children:const [
         SizedBox(height: 40,),
         const CustomAppBar(),
        ],
      ),
    );
  }
}
