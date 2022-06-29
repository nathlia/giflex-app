import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/screen/artifact-set-show/app_module_artifact_set_show.dart';
import 'package:giflex_app/screen/artifact/app_module_artifact.dart';
import 'package:giflex_app/screen/character/app_module_character.dart';
import 'package:giflex_app/screen/home/home.dart';
import 'package:giflex_app/screen/images/app_module_images.dart';
import 'package:giflex_app/screen/login.dart';
import 'package:giflex_app/screen/showcase/app_module_showcase.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => Login()),
        ChildRoute('/home', child: (context, args) => const Home()),
        ModuleRoute('/artifact-set-show', module: AppModuleArtifactSetShow()),
        ModuleRoute('/character', module: AppModuleCharacter()),
        ModuleRoute('/artifact', module: AppModuleArtifact()),
        ModuleRoute('/images', module: AppModuleImages()),
        ModuleRoute('/showcase', module: AppModuleShowcase()),
      ];
}
