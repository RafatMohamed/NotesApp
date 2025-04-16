import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_proj/core/constant/app_constant.dart';

import '../../../core/data/model.dart';
import 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final GlobalKey<FormState> keyForm = GlobalKey();

  Future add({required NoteModel notes}) async {
    emit(AddNoteLoading());
    try {
      var box = Hive.box<NoteModel>(kOpenBoxNote);
      await box.add(notes);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailed(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    titleController.dispose();
    descController.dispose();
    return super.close();
  }
}
