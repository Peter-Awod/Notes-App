import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/cubit/get_notes_cubit/get_notes_states.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';

import 'notes_list_view_builder.dart';

class NotesBodyView extends StatelessWidget {
  const NotesBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children:  [
          SizedBox(
            height: 40,
          ),
          CustomAppBar(title: 'Notes',icon: Icons.search_outlined,),
          SizedBox(
            height: 10,
          ),
          Expanded(child: NotesListViewBuilder()),
        ],
      ),
    );
  }
}


