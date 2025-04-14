import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'app/main_app.dart';
import 'core/constant/app_constant.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(kOpenBoxHive);
  runApp(const MyApp());
}

