import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit.dart';

import 'colors_item.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;

  List<Color> colorsList = const [
    Color(0xffDBC2CF),
    Color(0xffE0D3DE),
    Color(0xffD8D0C1),
    Color(0xffCBB8A9),
    Color(0xffB3B492),
    Color(0xff9FA2B2),
    Color(0xff3C7A89),
    Color(0xff6F686D),
    Color(0xff2E4756),
    Color(0xff16262E),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: colorsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).noteColor =
                    colorsList[index];
                setState(() {});
              },
              child: ColorItem(
                isSelected: index == currentIndex,
                selectedColor: colorsList[index],
              )),
        ),
      ),
    );
  }
}
