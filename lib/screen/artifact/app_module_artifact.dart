import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/screen/artifact/artifact.dart';

class AppModuleArtifact extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const Artifact()),
        // ChildRoute('/:charaId/:name/add', child: (context, args) => const Home()),
        // ChildRoute('/:charaId/:name/:artId/edit', child: (context, args) => const Home()),
        // ModuleRoute('/character', module: AppModuleCharacter()),
      ];
}
