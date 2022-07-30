import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/app-core/model/artifact.dart';
import 'package:giflex_app/app-core/model/artifact_set_type.dart';
import 'package:giflex_app/router.dart';
import 'package:giflex_app/screen/artifact/artifact.dart';

class ArtifactSetShow extends StatefulWidget {
  const ArtifactSetShow({Key? key}) : super(key: key);

  @override
  State<ArtifactSetShow> createState() => _ArtifactSetShowState();
}

class _ArtifactSetShowState extends State<ArtifactSetShow> {
  String name = "Xiao";
  int level = 90;
  double critRate = 76.9;
  double critDmg = 186.5;

  // ArtifactSetTypeModel type = ArtifactSetTypeModel(
  //     id: 1,
  //     name: "Gladiators",
  //     twopieces: "twopieces",
  //     fourpieces: "fourpieces");

  // ArtifactModel a1 =
  //     ArtifactModel(1, "Flower",  artifactSetType: type, artifactType: null);
  // ArtifactModel a2 =
  //     ArtifactModel(2, "Plume", "Gladiator's Finale", "ATK", 4200);

  int id = 1;
  String artifactType = "Flower";
  String artifactSetType = "Gladiator's Finale";
  String mainstat = "HP";
  double mainStatValue = 2000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.myColor[400],
      appBar: AppBar(
        title: const Text('Artifact Set Show'),
        backgroundColor: Palette.myColor[300],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
            left: 5.0, top: 20.0, right: 5.0, bottom: 20.0),
        child: Column(children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  color: Palette.myColor[300]),
              // * ~~~ Character Card ~~~ *
              height: 211,
              child: InkWell(
                onTap: () {
                  Modular.to.pushNamed('/character/');
                },
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 166,
                      child: _buildCard(name, './assets/characters/$name.png'),
                    ),
                    SizedBox(
                      width: 216,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text("Level: $level",
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(height: 15.0),
                              Text("Crit Rate: $critRate",
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(height: 15.0),
                              Text("Crit Dmg: $critDmg",
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
              )),
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
              child: InkWell(
                  onTap: () {
                    Modular.to.pushNamed('/artifact/');
                  },
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
                  ))),
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
                        Modular.to.pushNamed('/images/');
                      },
                      child: const Text('Create Showcase')))
            ],
          ),
        ]),
      ),
    );
  }

  Widget _buildCard(String name, String imgPath) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 6.0, bottom: 0.2, left: 5.0, right: 5.0),
        child: InkWell(
          onTap: () {
            Modular.to.pushNamed('/character/');
          },
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
}
