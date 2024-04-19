import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/shared/images.dart';

import 'images_item.dart';

class AddNoteImagesListView extends StatefulWidget {
  const AddNoteImagesListView({super.key});

  @override
  State<AddNoteImagesListView> createState() => _AddNoteImagesListViewState();
}

class _AddNoteImagesListViewState extends State<AddNoteImagesListView> {
  int currentIndex = 0;

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
              BlocProvider.of<AddNoteCubit>(context).noteImage =
                  reversedImagesList[index];
              BlocProvider.of<AddNoteCubit>(context).changeImage();
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
