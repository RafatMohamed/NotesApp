class ThemToggleState {}

final class ThemToggleInitial extends ThemToggleState {}

final class ThemToggleSuccess extends ThemToggleState {
  final bool isDark;

  ThemToggleSuccess({required this.isDark});
}
