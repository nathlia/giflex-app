import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/app-core/model/character.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            brightness: Brightness.dark,
            primarySwatch: Palette.myColor,
          ).copyWith(
            primary: Palette.myColor[50],
            secondary: Palette.myColor[100],
          ),
          textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
        ),
        home: Scaffold(
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
                        Text("Level: ${widget.character!.level}"),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input a value';
                            }
                            // emailUser = value;
                            return null;
                          },
                        ),
                        Text("Crit Rate: ${widget.character!.critRate}"),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input a value';
                            }

                            return null;
                          },
                        ),
                        Text("Crit Dmg: ${widget.character!.critDmg}"),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input a value';
                            }

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
                              log('Pressed');
                              Modular.to.navigate(
                                  '/artifact-set-show/${widget.character!.name}/${widget.character!.id}, arguments: character ');
                            },
                            child: const Text('Save'),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
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
