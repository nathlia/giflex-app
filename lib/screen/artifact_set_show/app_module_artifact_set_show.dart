import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/screen/artifact_set_show/artifact_set_show.dart';
import 'package:giflex_app/screen/character/edit_character.dart';

class AppModuleArtifactSetShow extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/:name/:id',
            child: (context, args) => ArtifactSetShow(
                  name: args.params['name'],
                  character: args.data,
                )),
        ChildRoute('/character/:name/:id',
            child: (context, args) => EditCharacter(
                  name: args.params['name'],
                  character: args.data,
                )),
        // ChildRoute('/:charaId/:name/:artId/edit', child: (context, args) => const Home()),
        // ModuleRoute('/character', module: AppModuleCharacter()),
      ];
}
