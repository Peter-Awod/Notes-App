import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:notes_app/cubit/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/cubit/get_notes_cubit/get_notes_states.dart';

import '../models/note_model.dart';
import '../widgets/Note/note_item_card.dart';

class NotesListViewBuilder extends StatelessWidget {
  const NotesListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNoteStates>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<GetNotesCubit>(context).notes ?? [];

        notes=notes.reversed.toList();

        return SingleChildScrollView(
          child: MasonryView(
            listOfItem: notes,
            numberOfColumn: 2,
            itemBuilder: (item) {
              return NoteCard(noteModel: item);
            },
            itemPadding: 0,
          ),
        );
      },
    );
  }
}

// ListView.builder(
// itemCount: notes.length ,
// physics: const BouncingScrollPhysics(),
// scrollDirection: Axis.vertical,
// itemBuilder: (context, index) {
// return NoteCard(noteModel: notes[index],);
// },
//
// )
