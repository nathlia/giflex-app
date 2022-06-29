import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/widgets.dart';
import 'package:giflex_app/app_module.dart';
import 'package:giflex_app/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(ModularApp(module: AppModule(), child: const AppRouter()));
}
