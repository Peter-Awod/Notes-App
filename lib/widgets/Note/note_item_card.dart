import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditView(
              noteModel: noteModel,
            ),
          ),
        );
      },
      padding: EdgeInsets.zero,
      child: Card(

        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        color: Color(noteModel.color),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 24,
            bottom: 24,
            start: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  noteModel.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    noteModel.subTitle,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    noteModel.delete();
                    BlocProvider.of<GetNotesCubit>(context).getAllNotes();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black.withOpacity(0.7),
                    size: 32,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    Text(
                      noteModel.date,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  const  Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditView(
                              noteModel: noteModel,
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.edit_note_outlined,
                        color: Colors.black.withOpacity(0.7),
                        size: 32,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
