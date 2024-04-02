import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/cubit/get_notes_cubit/get_notes_states.dart';

import '../models/note_model.dart';
import '../widgets/note_item_card.dart';

class NotesListViewBuilder extends StatelessWidget {
  const NotesListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit,GetNoteStates>(
      builder: (context, state) {

        List<NoteModel>notes=BlocProvider.of<GetNotesCubit>(context).notes??[];

        return ListView.builder(
          itemCount: notes.length ,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return NoteCard(noteModel: notes[index],);
          },

        );
      },
    );
  }
}