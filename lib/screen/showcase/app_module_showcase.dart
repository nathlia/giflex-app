import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/screen/showcase/showcase.dart';

class AppModuleShowcase extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const Showcase()),
        // ChildRoute('/:charaId/:name/add', child: (context, args) => const Home()),
        // ChildRoute('/:charaId/:name/:artId/edit', child: (context, args) => const Home()),
        // ModuleRoute('/character', module: AppModuleCharacter()),
      ];
}
