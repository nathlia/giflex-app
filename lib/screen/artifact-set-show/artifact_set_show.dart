import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ArtifactSetShow extends StatelessWidget {
  const ArtifactSetShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Artifact Set Show'),
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
                        Modular.to.pushNamed('/character');
                      },
                      child: const Text('Character'),
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
                            Modular.to.pushNamed('/artifact');
                          },
                          child: const Text('Artifact')))
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
                            Modular.to.pushNamed('/images');
                          },
                          child: const Text('Create Showcase')))
                ],
              ),
            ],
          ),
        ));
  }
}
