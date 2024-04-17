import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/shared/images.dart';

import 'images_item.dart';

class ImagesListView extends StatefulWidget {
  const ImagesListView({super.key});

  @override
  State<ImagesListView> createState() => _ImagesListViewState();
}

class _ImagesListViewState extends State<ImagesListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: imagesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: GestureDetector(
            onTap: () {
              currentIndex = index;
              BlocProvider.of<AddNoteCubit>(context).noteImage =
                  imagesList[index];
              BlocProvider.of<AddNoteCubit>(context).changeImage();
              setState(() {});
            },
            child: ImageItem(
              isSelected: index == currentIndex,
              selectedImage: imagesList[index],
            ),
          ),
        ),
      ),
    );
  }
}
