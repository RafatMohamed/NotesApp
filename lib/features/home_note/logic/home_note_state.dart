import 'package:notes_proj/core/data/model.dart';

class HomeNoteState {}

class HomeNoteInitial extends HomeNoteState {}

class HomeNoteLoading extends HomeNoteState {}

class HomeNoteSuccess extends HomeNoteState {}

class HomeNoteSearchSuccess extends HomeNoteState {
  List <NoteModel> notes;
  HomeNoteSearchSuccess({required this.notes});
}
