import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_proj/features/home_note/views/widget/list_view_builder.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../add_note/views/add_note_view.dart';
import '../logic/home_note_cubit.dart';

class HomeNoteView extends StatelessWidget {
  const HomeNoteView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            spacing: 10,
            children: [
              CustomAppBar(
                text: "Notes",
                onPress: () {},
                iconButton: Icons.search_outlined,
              ),
               Expanded(
                child: BlocProvider(
                  create: (context) => HomeNoteCubit()..geDataNote(),
                  child: const
                  ListViewBuilder(),
                ),
              ),
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
