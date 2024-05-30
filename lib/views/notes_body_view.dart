import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/widgets/custom/custom_app_bar.dart';

import '../cubit/language_cubit/language_cubit.dart';
import '../generated/l10n.dart';
import 'notes_list_view_builder.dart';

class NotesBodyView extends StatefulWidget {
  const NotesBodyView({super.key});

  @override
  State<NotesBodyView> createState() => _NotesBodyViewState();
}

class _NotesBodyViewState extends State<NotesBodyView> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<GetNotesCubit>(context).getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/note5.png')),
        ),
        child: Column(
          children: [
            CustomAppBar(
              title: S.of(context).homeTitle,
              icon: Icons.search_outlined,
              onPressed: () {},
              icon2: Icons.language_outlined,
              onPressed2: () {
                context.read<LanguageCubit>().toggleLanguage();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Expanded(child: NotesListViewBuilder()),
          ],
        ),
      ),
    );
  }
}
