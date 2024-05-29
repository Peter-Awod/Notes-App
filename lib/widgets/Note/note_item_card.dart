import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_view.dart';

import '../../cubit/get_notes_cubit/get_notes_cubit.dart';
import '../../generated/l10n.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MaterialButton(
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
          onLongPress: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.scale,

              headerAnimationLoop: false,
              // dialogBackgroundColor: kThemeColor,
              // titleTextStyle: const TextStyle(color: Colors.white),
              // descTextStyle: const TextStyle(color: Colors.white),

              title:  S.of(context).warning,
              desc:  S.of(context).warningMessage,
              btnOk: Row(
                children: [
                  ElevatedButton(
                    child: Text( S.of(context).cancel),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Spacer(),
                  ElevatedButton(
                    child: Text( S.of(context).delete),
                    onPressed: () {
                      noteModel.delete();
                      Navigator.of(context).pop();

                      BlocProvider.of<GetNotesCubit>(context).getAllNotes();
                    },
                  ),
                ],
              ),
              //this is ignored
            ).show();
          },
          padding: EdgeInsets.zero,
          child: Card(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            color: Color(noteModel.color),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(
                    noteModel.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      noteModel.subTitle,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  // trailing: IconButton(
                  //   onPressed: () {
                  //     noteModel.delete();
                  //     BlocProvider.of<GetNotesCubit>(context).getAllNotes();
                  //   },
                  //   icon: Icon(
                  //     Icons.delete,
                  //     color: Colors.black.withOpacity(0.7),
                  //     size: 32,
                  //   ),
                  // ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 16, bottom: 16, end: 16),
                  child: Text(
                    noteModel.date,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
