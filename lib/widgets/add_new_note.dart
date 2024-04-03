import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_states.dart';

import '../cubit/get_notes_cubit/get_notes_cubit.dart';
import 'add_note_form.dart';

class AddNewNote extends StatelessWidget {
  const AddNewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteStates>(
        listener: (context, state) {
          if (state is AddNoteFailureState) {
            print('Failed ${state.error}');
          }
          if (state is AddNoteSuccessState) {
            BlocProvider.of<GetNotesCubit>(context).getAllNotes();

            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoadingState ? true : false,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 16.0,
                  end: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SingleChildScrollView(child: AddNoteForm()),
              ),
            ),
          );
        },
      ),
    );
  }
}
