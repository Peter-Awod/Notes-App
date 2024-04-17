import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/cubit/get_notes_cubit/get_notes_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/shared/constants.dart';

class GetNotesCubit extends Cubit<GetNoteStates> {
  GetNotesCubit() : super(GetNoteInitialState());

  static GetNotesCubit get(context) => BlocProvider.of(context);

  List<NoteModel>?notes;
  void changeImage(){
    emit(NoteImageChangedState());
  }
  getAllNotes() async {
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      notes=notesBox.values.toList();
      List<NoteModel> notesList = notes!;
      emit(GetNoteSuccessState(notesList));
    } catch (error) {
      emit(
        GetNoteFailureState(error.toString()),
      );
    }
  }
}
