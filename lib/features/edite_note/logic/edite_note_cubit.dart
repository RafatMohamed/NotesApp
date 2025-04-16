import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_proj/core/constant/app_constant.dart';

import '../../../core/data/model.dart';
import 'edite_note_state.dart';

class EditeNoteCubit extends Cubit<EditeNoteState> {
  EditeNoteCubit() : super(EditeNoteInitial());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  Color selectedColor = Colors.blue;

  void changeColor(Color color) {
    selectedColor = color;
    emit(EditeNoteColorChanged()); // You can add a state to rebuild the UI
  }

  Future editeNote({required NoteModel notes, required int index}) async {

    emit(EditeNoteLoading());
    try {
      var box = Hive.box<NoteModel>(kOpenBoxNote);
      descController.text.isNotEmpty
          ? notes.desc = descController.text
          : notes.desc;
      titleController.text.isNotEmpty
          ? notes.title = titleController.text
          : notes.title;
      notes.color = selectedColor.toARGB32();
      await box.putAt(index, notes);
      emit(EditeNoteSuccess());
    } catch (e) {
      emit(EditeNoteFailed(error: e.toString()));
    }
  }@override
  Future<void> close() {
    titleController.dispose();
    descController.dispose();
    return super.close();
  }
}
