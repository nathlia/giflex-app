import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/router.dart';

class Artifact extends StatefulWidget {
  const Artifact({Key? key}) : super(key: key);

  @override
  State<Artifact> createState() => _ArtifactState();
}

class _ArtifactState extends State<Artifact> {
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
              title: const Text('Add Artifact'),
              backgroundColor: Palette.myColor[300],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(50),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        const Text("Type: "),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input a value';
                            }
                            return null;
                          },
                        ),
                        const Text("Set: "),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input a value';
                            }
                            return null;
                          },
                        ),
                        const Text("MainStat: "),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input a value';
                            }
                            return null;
                          },
                        ),
                        const Text("MainStat Value: "),
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
                              Modular.to.pushNamed('/artifact-set-show');
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

// class Artifact extends StatelessWidget {
//   const Artifact({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Artifact'),
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
//                             debugPrint('Artifact');
//                             Modular.to.navigate('/artifact');
//                           },
//                           child: const Text('Login Simple')))
//                 ],
//               )
//             ],
//           ),
//         ));
//   }
// }
