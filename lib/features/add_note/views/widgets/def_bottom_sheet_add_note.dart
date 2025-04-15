import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_proj/core/helper/my_navigator_app.dart';
import 'package:notes_proj/core/helper/notify_app.dart';
import 'package:notes_proj/features/add_note/data/model.dart';
import 'package:notes_proj/features/add_note/logic/add_note_cubit.dart';
import 'package:notes_proj/features/add_note/logic/add_note_state.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../../core/widgets/custom_text_form_field_widget.dart';
import '../../../../core/widgets/default_material_button.dart';

class DefaultBottomSheetAddNote extends StatelessWidget {
  const DefaultBottomSheetAddNote({super.key});

  @override
  Widget build(BuildContext context,) {
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
                    ),
                  ],
                ),
                BlocConsumer<AddNoteCubit, AddNoteState>(
                  listener: (context, state) {
                   if(state is AddNoteFailed){
                     AppNotify.snackBar(widget:Text(state.error), context: context);
                   }
                   if(state is AddNoteSuccess){
                     AppNavigator.navigatorPop(context: context);
                     AppNotify.snackBar(widget:const Text("Add Success"),context: context);
                   }
                  },
                  builder: (context, state) {
                    if(state is AddNoteLoading){
                     return AppNotify.circularProgress();
                    }
                    return DefaultMaterialButton(
                      text: "Add",
                      onPressed: () {
                        AddNoteModel addNoteModel =
                        AddNoteModel(
                            title: cubit.titleController.text,
                            desc: cubit.descController.text,
                            createdAt: DateTime.now(),
                            color: Colors.cyan.toARGB32(),
                        );
                        if (cubit.keyForm.currentState!.validate()) {
                          cubit.keyForm.currentState!.save();
                          cubit.add(notes: addNoteModel);
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
