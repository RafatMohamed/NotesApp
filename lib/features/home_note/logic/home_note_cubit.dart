import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_proj/core/constant/app_constant.dart';
import '../../add_note/data/model.dart';
import 'home_note_state.dart';

class HomeNoteCubit extends Cubit<HomeNoteState> {
  HomeNoteCubit() : super(HomeNoteInitial());
  List<AddNoteModel>? note;
  Future<void> geDataNote () async {
     emit(HomeNoteLoading());
     var box = Hive.box<AddNoteModel>(kOpenBoxNote);
     note = box.values.toList().cast<AddNoteModel>();
     emit(HomeNoteSuccess());
   }
}
