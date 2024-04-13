import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom/custom_text_field.dart';
import 'package:notes_app/shared/components/date_format.dart';


class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  var titleController = TextEditingController();
  var contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit,AddNoteStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        if (state is AddNoteLoadingState) {
          return const LinearProgressIndicator();
        } else {
          return Scaffold(
            appBar: _buildAppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      hintText: 'Title',
                      textController: titleController,
                      onSaved: (value) {
                        title = value;
                      },
                      onChanged: (value) {
                        title = value;
                        titleController.text = value;
                        setState(() {}); // Update UI when title changes
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      dateTimeFormat(
                        dateTime: DateTime.now(),
                      ),
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        hintText: 'Start Typing',
                        maxLines: 5000,
                        onSaved: (value) {
                          subTitle = value;
                        },
                        onChanged: (value) {
                          subTitle = value;
                          contentController.text = value;
                          setState(() {}); // Update UI when subtitle changes
                        },
                        textController: contentController,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
  PreferredSizeWidget _buildAppBar() {
    if ( subTitle != null  && subTitle!.isNotEmpty) {
      return AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (title == null || title!.isEmpty) {
                title = 'Untitled';
                titleController.text = title!;
              }
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                if (title == null || title!.isEmpty) {
                  title = 'Untitled';
                  titleController.text = title!;
                }
                var noteModel = NoteModel(
                  title: title!,
                  subTitle: subTitle!,
                  date: dateTimeFormat(dateTime: DateTime.now()),
                  color: BlocProvider.of<AddNoteCubit>(context)
                      .randomColor()
                      .value,
                );
                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
            icon: const Icon(Icons.check_outlined),
          )
        ],
      );
    }
       else {
        return AppBar();
      }

  }

  // PreferredSizeWidget _buildAppBar() {
  //   if (title != null && subTitle != null && title!.isNotEmpty && subTitle!.isNotEmpty) {
  //     return AppBar(
  //       actions: [
  //         IconButton( onPressed: () {
  //           if (formKey.currentState!.validate()) {
  //             formKey.currentState!.save();
  //             var noteModel = NoteModel(
  //               title: title!,
  //               subTitle: subTitle!,
  //               date: dateTimeFormat(dateTime: DateTime.now()),
  //               color: BlocProvider.of<AddNoteCubit>(context)
  //                   .randomColor()
  //                   .value,
  //             );
  //             BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
  //           } else {
  //             autovalidateMode = AutovalidateMode.always;
  //           }
  //         }, icon: const Icon(Icons.check_outlined,))
  //       ],
  //     );
  //   } else {
  //     return AppBar();
  //   }
  // }
}
