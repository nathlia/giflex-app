import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/app-core/service/character_service.dart';
import 'package:giflex_app/app-core/service/login_service.dart';
import 'package:giflex_app/router.dart';
import 'black.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

  final _focusNodeUsername = FocusNode();
  final _focusNodePassword = FocusNode();

  // String username = '';
  // String password = '';

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
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(
              bodyText2: TextStyle(color: Color.fromARGB(255, 75, 13, 114))),
        ),
        home: Scaffold(
            backgroundColor: Palette.myColor[400],
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      './assets/login.png',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Color.fromARGB(115, 83, 83, 83), BlendMode.darken)),
              ),
              child: Column(
                children: <Widget>[
                  Column(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25.0, top: 235, right: 25, bottom: 10),
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                            color: Color.fromARGB(255, 84, 71, 146),
                            fontSize: 60,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15, top: 60),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, top: 5, right: 25, bottom: 10),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 55,
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  color: Palette.myColor[700]!.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, top: 15, right: 25, bottom: 0),
                                child: TextFormField(
                                  controller: _username,
                                  focusNode: _focusNodeUsername,
                                  decoration: const InputDecoration.collapsed(
                                    hintText: "Username",
                                    hintStyle: TextStyle(
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(255, 221, 210, 247),
                                        fontStyle: FontStyle.italic),
                                  ),
                                  onTap: () =>
                                      _focusNodeUsername.requestFocus(),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Insert a valid email';
                                    }
                                    log("username: $_username");
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                            ),
                            Container(
                              height: 55,
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  color: Palette.myColor[700]!.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, top: 15, right: 25, bottom: 0),
                                child: TextFormField(
                                  controller: _password,
                                  focusNode: _focusNodePassword,
                                  decoration: const InputDecoration.collapsed(
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(255, 225, 220, 238),
                                        fontStyle: FontStyle.italic),
                                  ),
                                  onTap: () =>
                                      _focusNodePassword.requestFocus(),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Insert a valid password';
                                    }
                                    log('password:$_password');
                                    return null;
                                  },
                                  keyboardType: TextInputType.multiline,
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 56.0),
                              width: 200,
                              height: 160,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                ),
                                onPressed: () {
                                  log('Pressed');
                                  if (_formKey.currentState!.validate()) {
                                    bool ok = false;
                                    UserAccountService()
                                        .login(
                                            username: "_username.text",
                                            password: "_password.text")
                                        // username: "_username.text",
                                        // password: _password.text)
                                        .then((response) {
                                      if (response) {
                                        ok = true;
                                        Modular.to.navigate('/home');
                                      }
                                      log(ok.toString());
                                      if (ok == true) {}
                                    });
                                  }
                                },
                                child: const Text('Login'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
