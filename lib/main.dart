import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_proj/core/observe_model.dart';

import 'app/main_app.dart';
import 'core/constant/app_constant.dart';
import 'core/data/model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Bloc.observer = DefaultObserve();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(kOpenBoxNote);
  await Hive.openBox(kOpenBoxSettingThem);

  runApp(const MyApp());
}
