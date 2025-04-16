import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_proj/features/edite_note/views/widgets/def_bottom_sheet_edit_note.dart';

import '../../../core/data/model.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../logic/edite_note_cubit.dart';

class EditeNoteView extends StatelessWidget {
  const EditeNoteView({super.key, required this.note, required this.index});

  final NoteModel note;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => EditeNoteCubit(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  child: CustomAppBar(
                    text: "Edite Note",
                    onPress: () {},
                    iconButton: Icons.check_sharp,
                  ),
                ),
                DefaultBottomSheetEditeNote(note: note, index: index),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
