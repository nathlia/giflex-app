import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/screen/artifact_set_show/artifact_set_show.dart';
import 'package:giflex_app/screen/character/edit_character.dart';
import 'package:giflex_app/screen/home/home.dart';

class AppModuleArtifactSetShow extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const Home()),
        ChildRoute('/artifact-set-show/:name/:id',
            child: (context, args) => ArtifactSetShow(
                  name: args.params['name'],
                  character: args.data,
                )),
        // ChildRoute('/:charaId/:name/:artId/edit', child: (context, args) => const Home()),
        // ModuleRoute('/character', module: AppModuleCharacter()),
      ];
}
