import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_proj/core/helper/notify_app.dart';

import '../../../../core/data/model.dart';
import '../../logic/home_note_cubit.dart';
import '../../logic/home_note_state.dart';
import 'custom_list_view_widget.dart';

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({super.key});

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  initState() {
    BlocProvider.of<HomeNoteCubit>(context).geDataNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNoteCubit, HomeNoteState>(
      builder: (context, state) {
        if (state is HomeNoteLoading) {
          return AppNotify.circularProgress();
        }

        if (state is HomeNoteSuccess) {
          List<NoteModel> notes =
              BlocProvider.of<HomeNoteCubit>(context).note ?? [];

          if (notes.isEmpty) {
            return const Center(child: Text("No notes yet."));
          }

          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CustomListViewWidget(note: notes[index], index: index),
                  const SizedBox(height: 16),
                ],
              );
            },
          );
        }

        return const SizedBox(); // fallback
      },
    );
  }
}
