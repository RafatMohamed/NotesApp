import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultObserve extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("change : $change");
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint("close : $bloc");
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint("create : $bloc");
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint("error in $bloc : $error");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint("event : $event");
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint("transition : $transition");
    super.onTransition(bloc, transition);
  }
}
