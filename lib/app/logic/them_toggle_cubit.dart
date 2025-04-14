import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_proj/app/logic/them_toggle_state.dart';

class ThemToggleCubit extends Cubit<ThemToggleState> {
  ThemToggleCubit() : super(ThemToggleInitial());
  late  bool isDark=true;
  void toggleThem(){
    isDark=!isDark;
    emit(ThemToggleSuccess());
  }
}
