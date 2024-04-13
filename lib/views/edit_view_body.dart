import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/get_notes_cubit/get_notes_cubit.dart';

import '../models/note_model.dart';
import '../widgets/custom/custom_app_bar.dart';
import '../widgets/custom/custom_text_field.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({
    super.key,
    required this.noteModel,
  });

  final NoteModel noteModel;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title, subTitle;
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.noteModel.title);
    contentController = TextEditingController(text: widget.noteModel.subTitle);
    title = widget.noteModel.title;
    subTitle = widget.noteModel.subTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          // CustomAppBar(
          //   title: 'Edit Note',
          //   icon: Icons.check_outlined,
          //   onPressed: () {
          //     if (title != null) {
          //       widget.noteModel.title = title!;
          //     }
          //     // or another way
          //     if (subTitle != null) {
          //       widget.noteModel.subTitle = subTitle!;
          //     }
          //     widget.noteModel.save();
          //     BlocProvider.of<GetNotesCubit>(context).getAllNotes();
          //     Navigator.pop(context);
          //   },
          // ),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check_outlined,
            onPressed: () {
              if ((title == null || title!.isEmpty) &&
                  (subTitle == null || subTitle!.isEmpty)) {
                // Show dialog
                _showDeleteConfirmationDialog();
              } else {
                // Update note
                _updateNote();
              }
            },
          ),
          const SizedBox(
            height: 32,
          ),
          CustomTextFormField(
            hintText: 'Title',
            onChanged: (value) {
              title = value;
              titleController.text = value;
              setState(() {});
            },


            textController: titleController,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.noteModel.date,
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: CustomTextFormField(
              hintText: 'Content',
              maxLines: 5000,
              onChanged: (value) {
                subTitle = value;
                contentController.text = value;
                setState(() {});
              },
              textController: contentController,
            ),
          ),
        ],
      ),
    );
  }

  void _updateNote() {
    if (title == null||title!.isEmpty ) {
      title = 'Untitled';
      titleController.text = title!;
    }
    if (title != null) {
      widget.noteModel.title = title!;
    }
    if (subTitle != null) {
      widget.noteModel.subTitle = subTitle!;
    }
    widget.noteModel.save();
    BlocProvider.of<GetNotesCubit>(context).getAllNotes();
    Navigator.pop(context);
  }

  void _showDeleteConfirmationDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,
      headerAnimationLoop: false,
      title: 'Warning',
      desc: 'Are you sure you want to delete the note?',
      btnOk: Row(
        children: [
          ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const Spacer(),
          ElevatedButton(
            child: const Text('Delete'),
            onPressed: () {
              widget.noteModel.delete();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              BlocProvider.of<GetNotesCubit>(context).getAllNotes();
            },
          ),
        ],
      ),
    ).show();
  }
}
