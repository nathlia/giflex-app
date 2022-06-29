import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Artifact extends StatelessWidget {
  const Artifact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Artifact'),
        ),
        body: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                      ),
                      onPressed: () {
                        log('Pressed');
                        //int id = 1;
                        Modular.to.pushNamed('/artifact-set-show');
                      },
                      child: const Text('Save'),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                          ),
                          onPressed: () {
                            //onClickLogin(context);
                            debugPrint('Artifact');
                            Modular.to.navigate('/artifact');
                          },
                          child: const Text('Login Simple')))
                ],
              )
            ],
          ),
        ));
  }
}
