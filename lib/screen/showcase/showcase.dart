import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/app-core/model/character.dart';
import 'package:giflex_app/router.dart';

class Showcase extends StatefulWidget {
  final String? name;
  final CharacterModel? character;
  final String? id;
  const Showcase({Key? key, this.character, this.name, this.id})
      : super(key: key);

  @override
  State<Showcase> createState() => _ShowcaseState();
}

class _ShowcaseState extends State<Showcase> {
  late CharacterModel character;
  late String imageId;

  int id = 1;
  String artifactType = "Flower";
  String artifactSetType = "Gladiator's Finale";
  String mainstat = "HP";
  double mainStatValue = 2000;
  @override
  Widget build(BuildContext context) {
    character = widget.character!;
    imageId = widget.id!;
    return Scaffold(
        backgroundColor: Palette.myColor[400],
        appBar: AppBar(
          title: const Text('Showcase'),
          backgroundColor: Palette.myColor[300],
        ),
        body: SingleChildScrollView(
          child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                        left: 5.0, top: 20, bottom: 20, right: 5.0),
                    child: Image.asset(
                      './assets/showcase/${character.name}/$imageId.png',
                      height: 202,
                      width: 700,
                    ),
                  ),
                ]),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 360,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text("Level: ${character.level}",
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(height: 15.0),
                              Text("Crit Rate: ${character.critRate}",
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(height: 15.0),
                              Text("Crit Dmg: ${character.critDmg}",
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                // * ~~~ Artifacts ~~~ *
                Container(
                  padding: const EdgeInsets.only(
                      top: 16.0, bottom: 0.2, left: 5.0, right: 5.0),
                  child: Text("$artifactType :",
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                    width: 200.0,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        color: Palette.myColor[300]),
                    padding: const EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 10.0, bottom: 20.0),
                    child: Column(
                      children: <Widget>[
                        Divider(
                          color: Palette.myColor[50],
                          height: 3,
                        ),
                        Text(artifactSetType,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            )),
                        Divider(
                          color: Palette.myColor[50],
                          height: 3,
                        ),
                        Text(mainstat,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            )),
                        Divider(
                          color: Palette.myColor[50],
                          height: 3,
                        ),
                        Text("$mainStatValue",
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            )),
                        Divider(
                          color: Palette.myColor[50],
                          height: 3,
                        ),
                      ],
                    )),
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
                          Modular.to.pushNamed('/showcase');
                        },
                        child: const Text('Download'),
                      ),
                    )
                  ],
                ),
              ]),
        ));
  }
}
