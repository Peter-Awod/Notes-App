import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../models/note_model.dart';
import '../../shared/constants.dart';
import 'add_note_states.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(AddNoteInitialState());

  static AddNoteCubit get(context) => BlocProvider.of(context);

  randomColor(){
    Random random=Random();

    return kColorsList[random.nextInt(kColorsList.length)];

  }
  Color noteColor = const Color(0xffDBC2CF);
  addNote(NoteModel noteModel) async {
    emit(AddNoteLoadingState());
    // noteModel.color=randomColor().value;
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(noteModel);
      emit(AddNoteSuccessState());
    } catch (error) {
      emit(
        AddNoteFailureState(error.toString()),
      );
    }
  }
}
