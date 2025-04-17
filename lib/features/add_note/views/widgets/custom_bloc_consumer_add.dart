import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/data/model.dart';
import '../../../../core/helper/my_navigator_app.dart';
import '../../../../core/helper/notify_app.dart';
import '../../../../core/widgets/default_material_button.dart';
import '../../../home_note/logic/home_note_cubit.dart';
import '../../logic/add_note_cubit.dart';
import '../../logic/add_note_state.dart';

class BlocConsumerAddNote extends StatelessWidget{
  const BlocConsumerAddNote({super.key,required this.cubit});
  final AddNoteCubit cubit;
  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            AppNotify.snackBar(
              widget: Text(state.error),
              context: context,
            ),
          );
        }
        if (state is AddNoteSuccess) {
          BlocProvider.of<HomeNoteCubit>(context).geDataNote();
          ScaffoldMessenger.of(context).showSnackBar(
            AppNotify.snackBar(
              widget: const Text("Add Success"),
              context: context,
            ),
          );
          AppNavigator.navigatorPop(context: context);
        }
      },
      builder: (context, state) {
        if (state is AddNoteLoading) {
          return AppNotify.circularProgress();
        }
        return DefaultMaterialButton(
          text: "Add",
          onPressed: () {
            NoteModel addNoteModel = NoteModel(
              title: cubit.titleController.text,
              desc: cubit.descController.text,
              createdAt: DateTime.now(),
              color: cubit.selectedColor.toARGB32(),
            );
            if (cubit.keyForm.currentState!.validate()) {
              cubit.keyForm.currentState!.save();
              cubit.add(notes: addNoteModel);
            }
          },
        );
      },
    );
  }

}