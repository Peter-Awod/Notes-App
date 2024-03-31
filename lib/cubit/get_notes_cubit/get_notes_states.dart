import '../../models/note_model.dart';

 class GetNoteStates{}

class GetNoteInitialState extends GetNoteStates{}
class GetNoteLoadingState extends GetNoteStates{}
class GetNoteSuccessState extends GetNoteStates{
  final List<NoteModel>notesList;

  GetNoteSuccessState(this.notesList);
}
class GetNoteFailureState extends GetNoteStates{
  final String error;

  GetNoteFailureState(this.error);

}