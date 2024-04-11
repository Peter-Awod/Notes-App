import 'package:flutter/material.dart';

import '../widgets/Note/add_note_screen.dart';
import 'notes_body_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: const NotesBodyView(),
      floatingActionButton: FloatingActionButton(
        foregroundColor: const Color(0xff52397D),
        backgroundColor: const Color(0xffEBDDFF),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNewNoteScreen()),
          );
          // showModalBottomSheet(
          //   isScrollControlled: true,
          //   backgroundColor: kThemeColor,
          //   shape: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(8),
          //   ),
          //   context: context,
          //   builder: (context) {
          //     return const AddNewNote();
          //   },
          // );
        },
        child: const Icon(
          Icons.add_outlined,
          size: 32,
        ),
      ),
    );
  }
}
