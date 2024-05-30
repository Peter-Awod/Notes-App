import 'package:flutter/material.dart';

import '../widgets/Note/add_note_screen.dart';
import 'notes_body_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey[600],
          size: 30,
        ),
      ),
      // drawer: Padding(
      //   padding: const EdgeInsetsDirectional.only(top: 32, bottom: 16),
      //   child: Drawer(
      //     width: 200,
      //     backgroundColor: kThemeColor,
      //     child: ListView(
      //       padding: EdgeInsets.zero,
      //       children: [
      //         const DrawerHeader(
      //           decoration: BoxDecoration(
      //             color: kThemeColor,
      //           ),
      //           child: Text(
      //             'Menu',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 24,
      //             ),
      //           ),
      //         ),
      //         ListTile(
      //           title: const Text(
      //             'Change Theme',
      //             style: TextStyle(
      //               color: Colors.white,
      //             ),
      //           ),
      //           onTap: () {
      //             // Handle changing theme
      //           },
      //         ),
      //         ListTile(
      //           title: const Text(
      //             'Change Language',
      //             style: TextStyle(
      //               color: Colors.white,
      //             ),
      //           ),
      //           onTap: () {
      //             // Handle changing language
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
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
        },
        child: const Icon(
          Icons.add_outlined,
          size: 32,
        ),
      ),
    );
  }
}
