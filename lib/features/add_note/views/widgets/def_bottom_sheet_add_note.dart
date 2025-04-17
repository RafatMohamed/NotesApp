import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_proj/features/add_note/logic/add_note_cubit.dart';
import 'package:notes_proj/features/add_note/logic/add_note_state.dart';
import 'package:notes_proj/features/add_note/views/widgets/custom_bloc_consumer_add.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../../core/widgets/custom_text_form_field_widget.dart';
import '../../../../core/widgets/pick_color.dart';

class DefaultBottomSheetAddNote extends StatelessWidget {
  const DefaultBottomSheetAddNote({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddNoteCubit>();
    return Form(
      key: cubit.keyForm,
      child: Padding(
        padding: MediaQuery
            .of(context)
            .viewInsets,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
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
                      hintText: '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'the Form is required';
                        }
                        return null;
                      },
                    ),
                    TextFormFieldApp(
                      textInputAction: TextInputAction.done,
                      controller: cubit.descController,
                      onFieldSubmitted: (content) {
                        cubit.descController.text = content;
                      },
                      labelText: 'Content',
                      maxLine: 5,
                      labelColor: kPrimaryColor,
                      hintText: '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'the Form is required';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                BlocBuilder<AddNoteCubit,AddNoteState>(
                  builder: (context, state)
                  {
                    return PickColorItems(cubit: cubit,);
                  },
                ),
               BlocConsumerAddNote(cubit: cubit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
