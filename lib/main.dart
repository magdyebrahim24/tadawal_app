import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadawal/app.dart';
import 'package:tadawal/core/utils/bloc_observer.dart';
import 'injection_container.dart' as di;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = AppBlocObserver();
  runApp(const TadawalApp());
}

