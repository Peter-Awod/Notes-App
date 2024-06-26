import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom/custom_text_field.dart';
import 'package:notes_app/shared/components/date_format.dart';

import '../../generated/l10n.dart';
import '../images/add_note_images_list_view.dart';

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
  var subTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AddNoteLoadingState) {
          return const LinearProgressIndicator();
        } else {
          return Scaffold(
            appBar: _buildAppBar(),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    BlocProvider.of<AddNoteCubit>(context).noteImage,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        hintText: S.of(context).hintTitle,
                        textController: titleController,
                        onSaved: (value) {
                          title = value;
                        },
                        onChanged: (value) {
                          title = value;
                          //titleController.text = value;
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
                          hintText: S.of(context).hintSubtitle,
                          maxLines: 5000,
                          onSaved: (value) {
                            subTitle = value;
                          },
                          onChanged: (value) {
                            subTitle = value;
                            //  subTitleController.text = value;
                            setState(() {}); // Update UI when subtitle changes
                          },
                          textController: subTitleController,
                        ),
                      ),
                      const AddNoteImagesListView(),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  PreferredSizeWidget _buildAppBar() {
    if (subTitle != null && subTitle!.isNotEmpty) {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(0.05),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.check_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                if (title == null || title!.isEmpty) {
                  title = 'Untitled';
                  titleController.text = title!;
                }
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var noteModel = NoteModel(
                    image: BlocProvider.of<AddNoteCubit>(context).noteImage,
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
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      );
    } else {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
