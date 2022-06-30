import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/router.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

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
              title: const Text('Login'),
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
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insert a valid email';
                            }
                            // emailUser = value;
                            return null;
                          },
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insert a valid password';
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
                              Modular.to.pushNamed('/home');
                            },
                            child: const Text('Login'),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Column(
                  //   children: <Widget>[
                  //     Container(
                  //         padding: const EdgeInsets.symmetric(vertical: 50.0),
                  //         width: double.infinity,
                  //         child: ElevatedButton(
                  //             style: ElevatedButton.styleFrom(
                  //               elevation: 5,
                  //             ),
                  //             onPressed: () {
                  //               //onClickLogin(context);
                  //               debugPrint('Pressed Login Simple');
                  //               Modular.to.navigate('/home');
                  //             },
                  //             child: const Text('Login Simple')))
                  //   ],
                  // )
                ],
              ),
            )));
  }
}
