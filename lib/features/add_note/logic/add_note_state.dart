class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteLoading extends AddNoteState {}

final class AddNoteSuccess extends AddNoteState {}

final class AddNoteFailed extends AddNoteState {
  final String error;
  AddNoteFailed({required this.error});
}
final class EditeNoteColorChanged extends AddNoteState {}

