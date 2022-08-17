import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/widgets.dart';
import 'package:giflex_app/app-core/persistence/open_database.dart';
import 'package:giflex_app/app-core/service/locator.dart';
import 'package:giflex_app/app_module.dart';
import 'package:giflex_app/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  getDatabase();

  return runApp(ModularApp(module: AppModule(), child: const AppRouter()));
}
