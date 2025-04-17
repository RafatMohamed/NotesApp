import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/data/model.dart';
import '../../../../core/helper/my_navigator_app.dart';
import '../../../../core/helper/notify_app.dart';
import '../../../../core/widgets/default_material_button.dart';
import '../../../home_note/logic/home_note_cubit.dart';
import '../../logic/edite_note_cubit.dart';
import '../../logic/edite_note_state.dart';

class BlocConsumerEditeNote extends StatelessWidget{
  const BlocConsumerEditeNote({super.key, required this.note, required this.index, required this.cubit});
  final NoteModel note;
  final int index;
  final EditeNoteCubit cubit;
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<EditeNoteCubit, EditeNoteState>(
      listener: (context, state) {
        if (state is EditeNoteFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            AppNotify.snackBar(
              widget: Text(state.error),
              context: context,
            ),
          );
        }
        if (state is EditeNoteSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            AppNotify.snackBar(
              widget: const Text("Edite Success"),
              context: context,
            ),
          );
          AppNavigator.navigatorPop(context: context);
          BlocProvider.of<HomeNoteCubit>(context).geDataNote();
        }
      },
      builder: (context, state) {
        if (state is EditeNoteLoading) {
          return AppNotify.circularProgress();
        }
        return DefaultMaterialButton(
          text: "Save",
          onPressed: () {
            cubit.editeNote(notes: note, index: index);
            note.save();
          },
        );
      },
    );
  }

}