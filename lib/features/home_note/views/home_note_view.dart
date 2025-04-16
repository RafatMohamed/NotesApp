import 'package:flutter/material.dart';
import 'package:notes_proj/features/home_note/views/widget/list_view_builder.dart';
import 'package:notes_proj/features/home_note/views/widget/text_button_clear.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../add_note/views/add_note_view.dart';

class HomeNoteView extends StatelessWidget {
  const HomeNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            spacing: 10,
            children: [
             const CustomAppBar(
                text: "Notes",
             ),
              const Expanded(child: ListViewBuilder()),
              textClearNote(context),
            ],
          ),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: const AddNoteView(),
    );
  }
}
