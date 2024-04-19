import 'package:flutter/material.dart';
import 'package:notes_app/shared/constants.dart';

import '../widgets/Note/add_note_screen.dart';
import 'notes_body_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
      // drawer: Padding(
      //   padding: const EdgeInsetsDirectional.only(top: 32, bottom: 16),
      //   child: Drawer(
      //     width: 200,
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
      //           title: const Text('Change Theme'),
      //           onTap: () {
      //             // Handle changing theme
      //           },
      //         ),
      //         ListTile(
      //           title: const Text('Change Language'),
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
