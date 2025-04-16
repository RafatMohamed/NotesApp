class EditeNoteState {}

final class EditeNoteInitial extends EditeNoteState {}

final class EditeNoteLoading extends EditeNoteState {}

final class EditeNoteSuccess extends EditeNoteState {}

final class EditeNoteFailed extends EditeNoteState {
  final String error;

  EditeNoteFailed({required this.error});
}
final class EditeNoteColorChanged extends EditeNoteState {}
