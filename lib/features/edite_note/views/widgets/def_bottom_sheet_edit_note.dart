import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_proj/core/widgets/pick_color.dart';
import 'package:notes_proj/features/edite_note/logic/edite_note_cubit.dart';
import 'package:notes_proj/features/edite_note/logic/edite_note_state.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/data/model.dart';
import '../../../../core/widgets/custom_text_form_field_widget.dart';
import 'custom_bloc_consumer_edite.dart';

class DefaultBottomSheetEditeNote extends StatelessWidget {
  const DefaultBottomSheetEditeNote({
    super.key,
    required this.note,
    required this.index,
  });

  final NoteModel note;
  final int index;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<EditeNoteCubit>(context);
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 10,
              children: [
                TextFormFieldApp(
                  textInputAction: TextInputAction.next,
                  controller: cubit.titleController,
                  onFieldSubmitted: (title) {
                    cubit.titleController.text = title;
                  },
                  labelText: 'Title',
                  labelColor: kPrimaryColor,
                  hintText: note.title,
                ),
                TextFormFieldApp(
                  textInputAction: TextInputAction.done,
                  controller: cubit.descController,
                  onFieldSubmitted: (desc) {
                    cubit.descController.text = desc;
                  },
                  labelText: 'Content',
                  maxLine: 5,
                  labelColor: kPrimaryColor,
                  hintText: note.desc,
                ),
              ],
            ),
            BlocBuilder<EditeNoteCubit, EditeNoteState>(
              buildWhen: (previous, current) => current is EditeNoteColorChanged,
              builder: (context, state) {
                return PickColorItems(cubit: cubit);
              },
            ),
            BlocConsumerEditeNote(cubit: cubit,index: index,note: note,),
          ],
        ),
      ),
    );
  }
}
