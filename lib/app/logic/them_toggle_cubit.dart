import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_proj/app/logic/them_toggle_state.dart';
import 'package:notes_proj/core/constant/app_constant.dart';

class ThemToggleCubit extends Cubit<ThemToggleState> {
  final Box settingsThemBox = Hive.box(kOpenBoxSettingThem);
  bool isDark = true;
  ThemToggleCubit() : super(ThemToggleInitial()) {
    final isDark = settingsThemBox.get('isDark', defaultValue: true);
    emit(ThemToggleSuccess(isDark: isDark));
  }

  void toggleTheme() {
    if (state is ThemToggleSuccess) {
      final current = (state as ThemToggleSuccess).isDark;
      final newTheme = !current;
      settingsThemBox.put('isDark', newTheme);
      emit(ThemToggleSuccess(isDark: newTheme));
    }
  }
}
