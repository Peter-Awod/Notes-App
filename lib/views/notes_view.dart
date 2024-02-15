
import 'package:flutter/material.dart';

import 'notes_body_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesBodyView(),
    );
  }
}
