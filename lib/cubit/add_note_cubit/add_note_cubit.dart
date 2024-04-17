import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../models/note_model.dart';
import '../../shared/colors.dart';
import '../../shared/constants.dart';
import 'add_note_states.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(AddNoteInitialState());

  static AddNoteCubit get(context) => BlocProvider.of(context);

  randomColor(){
    Random random=Random();

    return kColorsList[random.nextInt(kColorsList.length)];

  }
  String noteImage =  'assets/img21.jpg';
  String changeImage(){
   emit(NoteImageChangedState());
    return noteImage;

  }
  addNote(NoteModel noteModel) async {
    emit(AddNoteLoadingState());
    // noteModel.color=randomColor().value;
    noteModel.image=noteImage;
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
