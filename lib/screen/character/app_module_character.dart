import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/screen/character/edit_character.dart';

class AppModuleCharacter extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/:name/:id',
            child: (context, args) => EditCharacter(
                  name: args.params['name'],
                  character: args.data,
                )),
        // ChildRoute('/:id':name/edit, child: (context, args) => const Home()),
      ];
}
