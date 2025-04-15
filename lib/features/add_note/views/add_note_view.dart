import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_proj/core/constant/app_constant.dart';
import 'package:notes_proj/features/add_note/logic/add_note_cubit.dart';
import 'widgets/def_bottom_sheet_add_note.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kPrimaryColor,
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          useSafeArea: true,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16)
          ),
          context: context,
          builder: (context) =>
              BlocProvider(
                create: (context) => AddNoteCubit(),
                child: const DefaultBottomSheetAddNote(),
              ),
        );
      },
      child: const Icon(Icons.add, color: Colors.black),
    );
  }

}
