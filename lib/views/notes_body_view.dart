import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/widgets/custom/custom_app_bar.dart';

import 'notes_list_view_builder.dart';

class NotesBodyView extends StatefulWidget {
  const NotesBodyView({super.key});

  @override
  State<NotesBodyView> createState() => _NotesBodyViewState();
}

class _NotesBodyViewState extends State<NotesBodyView> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<GetNotesCubit>(context).getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/note5.png')),
        ),
        child: Column(
          children: [

            const SizedBox(
              height: 40,
            ),
            CustomAppBar(
              title: 'Notes',
              icon: Icons.search_outlined,
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            const Expanded(child: NotesListViewBuilder()),
          ],
        ),
      ),
    );
  }
}
