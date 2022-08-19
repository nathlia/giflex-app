import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/app-core/model/character.dart';
import 'package:giflex_app/router.dart';

class Images extends StatefulWidget {
  final String? name;
  final CharacterModel? character;

  const Images({Key? key, this.character, this.name}) : super(key: key);

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  late CharacterModel character;
  int imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    character = widget.character!;
    log(character.name!);
    return Scaffold(
        backgroundColor: Palette.myColor[400],
        appBar: AppBar(
          title: const Text('Images'),
          backgroundColor: Palette.myColor[300],
        ),
        body: SingleChildScrollView(
            child: InkWell(
          onTap: () {
            Modular.to.pushNamed('/showcase/${character.name}/$imageIndex',
                arguments: character);
          },
          child: Column(
            children: <Widget>[
              Column(children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                      left: 5.0, top: 20, bottom: 20, right: 5.0),
                  child: Image.asset(
                    './assets/showcase/${character.name}/${imageIndex = 1}.png',
                    height: 202,
                    width: 700,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 5.0, top: 20, bottom: 20, right: 5.0),
                  child: Image.asset(
                    './assets/showcase/${character.name}/${imageIndex = 2}.png',
                    height: 202,
                    width: 700,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 5.0, top: 20, bottom: 20, right: 5.0),
                  child: Image.asset(
                    './assets/showcase/${character.name}/${imageIndex = 3}.png',
                    height: 202,
                    width: 700,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 5.0, top: 20, bottom: 20, right: 5.0),
                  child: Image.asset(
                    './assets/showcase/${character.name}/${imageIndex = 4}.png',
                    height: 202,
                    width: 700,
                  ),
                ),
              ]),
            ],
          ),
        )));
  }
}
