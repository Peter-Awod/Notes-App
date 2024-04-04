import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/get_notes_cubit/get_notes_cubit.dart';

import '../models/note_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';

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
  String? title, content;
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.noteModel.title);
    contentController = TextEditingController(text: widget.noteModel.subTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check_outlined,
            onPressed: () {
              widget.noteModel.title = title ?? widget.noteModel.title;
              // or another way
              if (content != null) {
                widget.noteModel.subTitle = content!;
              }
              widget.noteModel.save();
              BlocProvider.of<GetNotesCubit>(context).getAllNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hintText: 'Title',
            onChanged: (value) {
              title = value;
              titleController.text = value;
            },
            textController: titleController,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: CustomTextField(
              hintText: 'Content',
              maxLines: 1000,
              onChanged: (value) {
                content = value;
                contentController.text = value;
              },
              textController: contentController,
            ),
          ),
        ],
      ),
    );
  }
}
