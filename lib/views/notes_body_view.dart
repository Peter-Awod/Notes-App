import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';

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
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search_outlined,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: NotesListViewBuilder()),
        ],
      ),
    );
  }
}
