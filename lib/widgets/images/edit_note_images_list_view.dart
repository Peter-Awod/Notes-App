import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/shared/images.dart';

import 'images_item.dart';

class EditNoteImagesListView extends StatefulWidget {
  const EditNoteImagesListView({super.key, required this.noteModel});

  final NoteModel noteModel;
  @override
  State<EditNoteImagesListView> createState() => _EditNoteImagesListViewState();
}

class _EditNoteImagesListViewState extends State<EditNoteImagesListView> {
 late int currentIndex ;
@override
  void initState() {

  currentIndex=imagesList.indexOf(widget.noteModel.image);
    super.initState();
  }
 List<String>reversedImagesList=imagesList.reversed.toList();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: reversedImagesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.noteModel.image=reversedImagesList[index];
             BlocProvider.of<GetNotesCubit>(context).changeImage();
              setState(() {});
            },
            child: ImageItem(
              isSelected: index == currentIndex,
              selectedImage: reversedImagesList[index],
            ),
          ),
        ),
      ),
    );
  }
}
