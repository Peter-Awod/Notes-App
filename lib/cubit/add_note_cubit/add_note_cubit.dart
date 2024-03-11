import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../models/note_model.dart';
import '../../shared/constants.dart';
import 'add_note_states.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(AddNoteInitialState());

  static AddNoteCubit get(context) => BlocProvider.of(context);

  addNote(NoteModel noteModel) async {
    emit(AddNoteLoadingState());
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
