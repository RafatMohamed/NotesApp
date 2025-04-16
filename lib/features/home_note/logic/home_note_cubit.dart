import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_proj/core/constant/app_constant.dart';

import '../../../core/data/model.dart';
import 'home_note_state.dart';

class HomeNoteCubit extends Cubit<HomeNoteState> {
  HomeNoteCubit() : super(HomeNoteInitial());
  List<NoteModel>? note;

  Future<void> geDataNote() async {
    emit(HomeNoteLoading());
    var box = Hive.box<NoteModel>(kOpenBoxNote);
    note = box.values.toList().cast<NoteModel>();
    emit(HomeNoteSuccess());
  }

  clear() async {
    var box = Hive.box<NoteModel>(kOpenBoxNote);
    await box.clear();
  }
}
