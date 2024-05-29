import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/cubit/get_notes_cubit/get_notes_states.dart';

import '../generated/l10n.dart';
import '../models/note_model.dart';
import '../widgets/custom/custom_app_bar.dart';
import '../widgets/custom/custom_text_field.dart';
import '../widgets/images/edit_note_images_list_view.dart';

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
  late TextEditingController subTitleController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.noteModel.title);
    subTitleController = TextEditingController(text: widget.noteModel.subTitle);
    title = widget.noteModel.title;
    subTitle = widget.noteModel.subTitle;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetNotesCubit, GetNoteStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.noteModel.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                CustomAppBar(
                  title: S.of(context).editTitle,
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
                  hintText: S.of(context).hintTitle,
                  onChanged: (value) {
                    title = value;
                    //  titleController.text = value;
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
                    hintText: S.of(context).hintSubtitle,
                    maxLines: 5000,
                    onChanged: (value) {
                      subTitle = value;
                      // contentController.text = value;
                      setState(() {});
                    },
                    textController: subTitleController,
                  ),
                ),
                EditNoteImagesListView(
                  noteModel: widget.noteModel,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _updateNote() {
    if (title == null || title!.isEmpty) {
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
      title:  S.of(context).warning,
      desc:  S.of(context).warningMessage,
      btnOk: Row(
        children: [
          ElevatedButton(
            child:  Text( S.of(context).cancel),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const Spacer(),
          ElevatedButton(
            child:  Text( S.of(context).delete),
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
