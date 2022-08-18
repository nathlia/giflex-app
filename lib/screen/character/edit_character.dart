import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/app-core/model/character.dart';
import 'package:giflex_app/app-core/service/character_service.dart';
import 'package:giflex_app/router.dart';

class EditCharacter extends StatefulWidget {
  final String? name;
  final CharacterModel? character;

  const EditCharacter({Key? key, this.character, this.name}) : super(key: key);

  @override
  State<EditCharacter> createState() => _EditCharacterState();
}

class _EditCharacterState extends State<EditCharacter> {
  final _formKey = GlobalKey<FormState>();
  final _level = TextEditingController();
  final _critRate = TextEditingController();
  final _critDmg = TextEditingController();

  late CharacterModel character;

  @override
  void dispose() {
    super.dispose();
    _level.dispose();
    _critRate.dispose();
    _critDmg.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.character != null) {
      character = widget.character!;

      if (widget.character!.level != null) {
        _level.text = widget.character!.level!;
      }
      if (widget.character!.critRate != null) {
        _critRate.text = widget.character!.critRate!;
      }
      if (widget.character!.critDmg != null) {
        _critDmg.text = widget.character!.critDmg!;
      }
    }
    return Scaffold(
        backgroundColor: Palette.myColor[400],
        appBar: AppBar(
          title: const Text('Edit Character'),
          backgroundColor: Palette.myColor[300],
        ),
        body: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                          top: 16.0, bottom: 70.0, left: 5.0, right: 5.0),
                      child: SizedBox(
                        width: 166,
                        child: _buildCard(widget.name!,
                            './assets/characters/${widget.name}.png'),
                      ),
                    ),
                    const Text("Level:"),
                    TextFormField(
                      controller: _level,
                      validator: (value) {
                        return null;
                      },
                    ),
                    const Text("Crit Rate: "),
                    TextFormField(
                      controller: _critRate,
                      validator: (value) {
                        return null;
                      },
                    ),
                    const Text("Crit Dmg: "),
                    TextFormField(
                      controller: _critDmg,
                      validator: (value) {
                        return null;
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                        ),
                        onPressed: () {
                          log('Pressed edit character');
                          log('${widget.character!.id}');
                          log('${widget.name}');
                          log(_level.text);
                          log(_critRate.text);
                          log(_critDmg.text);

                          if (_formKey.currentState!.validate()) {
                            CharacterModel characterEdit = CharacterModel(
                                id: character.id,
                                name: widget.name,
                                level: _level.text,
                                critRate: _critRate.text,
                                critDmg: _critDmg.text);

                            CharacterService()
                                .edit(characterEdit)
                                .then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(value)),
                              );
                              Modular.to.popAndPushNamed(
                                  '/artifact-set-show/${character.name}/${character.id}',
                                  arguments: character);
                            });
                          }
                        },
                        child: const Text('Save'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

Widget _buildCard(String name, String imgPath) {
  return Padding(
      padding:
          const EdgeInsets.only(top: 6.0, bottom: 0.2, left: 5.0, right: 5.0),
      child: InkWell(
        // onTap: () {
        //   Modular.to.pushNamed('/character/');
        // },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Palette.myColor.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Palette.myColor[700]),
          child: Column(
            children: [
              Hero(
                  tag: imgPath,
                  child: Container(
                      height: 156.0,
                      width: 256.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imgPath),
                              fit: BoxFit.contain)))),
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0)),
                    color: Palette.myColor[600]),
                padding: const EdgeInsets.all(8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ));
}



// class EditCharacter extends StatelessWidget {
//   const EditCharacter({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Edit Character'),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             //crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   Container(
//                     padding: const EdgeInsets.symmetric(vertical: 50.0),
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         elevation: 5,
//                       ),
//                       onPressed: () {
//                         log('Pressed');
//                         //int id = 1;
//                         Modular.to.pushNamed('/artifact-set-show');
//                       },
//                       child: const Text('Save'),
//                     ),
//                   )
//                 ],
//               ),
//               Column(
//                 children: <Widget>[
//                   Container(
//                       padding: const EdgeInsets.symmetric(vertical: 50.0),
//                       width: double.infinity,
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             elevation: 5,
//                           ),
//                           onPressed: () {
//                             //onClickLogin(context);
//                             debugPrint('Pressed Login Simple');
//                             Modular.to.navigate('/home');
//                           },
//                           child: const Text('Login Simple')))
//                 ],
//               )
//             ],
//           ),
//         ));
//   }
// }
