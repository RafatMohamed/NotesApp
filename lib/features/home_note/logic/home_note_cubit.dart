import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_proj/core/constant/app_constant.dart';

import '../../../core/data/model.dart';
import 'home_note_state.dart';

class HomeNoteCubit extends Cubit<HomeNoteState> {
  HomeNoteCubit() : super(HomeNoteInitial());
  bool isSearch=false;
  TextEditingController searchController =TextEditingController();

  List<NoteModel> note=[];
  List<NoteModel> search=[];

  Future<void> geDataNote() async {
    emit(HomeNoteLoading());
    var box = Hive.box<NoteModel>(kOpenBoxNote);
    note = box.values.toList().cast<NoteModel>();
    emit(HomeNoteSuccess());
  }
  void searchNote(String query) {
    if (query.isEmpty) {
      search = List.from(note);
    } else {
      search = note.where((note) {
        return note.title.toLowerCase().contains(query.toLowerCase()) ||
            note.desc.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    emit(HomeNoteSearchSuccess(notes: search));
  }
  void resetSearch() {
    var box = Hive.box<NoteModel>(kOpenBoxNote);
    note = box.values.toList();
    search = note;
    emit(HomeNoteSearchSuccess(notes: search));
  }



  clear() async {
    var box = Hive.box<NoteModel>(kOpenBoxNote);
    await box.clear();
  }
}
