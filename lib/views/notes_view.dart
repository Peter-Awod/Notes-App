import 'package:flutter/material.dart';

import 'notes_body_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesBodyView(),
      floatingActionButton: FloatingActionButton(
        foregroundColor: const Color(0xff52397D),
        backgroundColor: const Color(0xffEBDDFF),
        onPressed: () {},
        child: Icon(
          Icons.add_outlined,
          size: 32,
        ),

      ),
    );
  }
}
