import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/app-core/model/artifact.dart';
import 'package:giflex_app/app-core/model/artifact_set_type.dart';
import 'package:giflex_app/app-core/model/character.dart';
import 'package:giflex_app/app-core/model/character_artifact.dart';
import 'package:giflex_app/app-core/persistence/character_persistence.dart';
import 'package:giflex_app/app-core/service/artifact_service.dart';
import 'package:giflex_app/app-core/service/character_artifact_service.dart';
import 'package:giflex_app/app-core/service/character_service.dart';
import 'package:giflex_app/router.dart';
import 'package:giflex_app/screen/artifact/artifact.dart';

class ArtifactSetShow extends StatefulWidget {
  final String? name;

  final CharacterModel? character;

  const ArtifactSetShow({Key? key, this.character, this.name})
      : super(key: key);

  @override
  State<ArtifactSetShow> createState() => _ArtifactSetShowState();
}

class _ArtifactSetShowState extends State<ArtifactSetShow> {
  int id = 1;
  String artifactType = "Flower";
  String artifactSetType = "Gladiator's Finale";
  String mainstat = "HP";
  double mainStatValue = 2000;

  late CharacterModel character;

  @override
  Widget build(BuildContext context) {
    character = widget.character!;
    log(widget.name!);
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
                  Modular.to.pushNamed(
                      '/character/${character.name}/${character.id}',
                      arguments: character);
                },
                child: _futureBuilderCharacter(),
              )),
          // Column(children: <Widget>[
          //   // * ~~~ Artifacts ~~~ *
          //   //_futureBuilderCharacterArtifact(),
          //   // _futureBuilderArtifacts()
          // ]),
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
                        Modular.to.pushNamed(
                            '/images/${character.name}/${character.id}',
                            arguments: character);
                      },
                      child: const Text('Create Showcase')))
            ],
          ),
        ]),
      ),
    );
  }

  // //* Gets Artifacts from Database *
  // Widget _futureBuilderArtifacts() {
  //   return FutureBuilder<List<ArtifactModel>>(
  //     future: ArtifactService().getAllArtifacts(),
  //     builder: (context, snapshot) {
  //       switch (snapshot.connectionState) {
  //         case ConnectionState.none:
  //           break;
  //         case ConnectionState.waiting:
  //           return Center(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: const <Widget>[
  //                 CircularProgressIndicator(),
  //                 Text('Loading'),
  //               ],
  //             ),
  //           );
  //         case ConnectionState.active:
  //           break;
  //         case ConnectionState.done:
  //           final List<ArtifactModel> artifacts =
  //               snapshot.data as List<ArtifactModel>;
  //           return ListView.builder(
  //             itemBuilder: (context, index) {
  //               // final ArtifactModel a = artifacts[index];
  //               //String? name = a.name;
  //               return Row(
  //                 children: [
  //                   Container(
  //                     padding: const EdgeInsets.only(
  //                         top: 16.0, bottom: 0.2, left: 5.0, right: 5.0),
  //                     child: const Text(":",
  //                         style: TextStyle(
  //                           fontSize: 20.0,
  //                           fontWeight: FontWeight.bold,
  //                         )),
  //                   ),

  //                   // Container(
  //                   //     width: 200.0,
  //                   //     decoration: BoxDecoration(
  //                   //         borderRadius: const BorderRadius.all(
  //                   //           Radius.circular(15.0),
  //                   //         ),
  //                   //         color: Palette.myColor[300]),
  //                   //     padding: const EdgeInsets.only(
  //                   //         left: 5.0, right: 5.0, top: 10.0, bottom: 20.0),
  //                   //     child: InkWell(
  //                   //         onTap: () {
  //                   //           Modular.to.pushNamed('/artifact/');
  //                   //         },
  //                   //         child: Column(
  //                   //           children: <Widget>[
  //                   //             Divider(
  //                   //               color: Palette.myColor[50],
  //                   //               height: 3,
  //                   //             ),
  //                   //             Text("${a.artifactSetType}",
  //                   //                 style: const TextStyle(
  //                   //                   fontSize: 18.0,
  //                   //                   fontWeight: FontWeight.bold,
  //                   //                 )),
  //                   //             Divider(
  //                   //               color: Palette.myColor[50],
  //                   //               height: 3,
  //                   //             ),
  //                   //             Text('${a.mainstat}',
  //                   //                 style: const TextStyle(
  //                   //                   fontSize: 18.0,
  //                   //                   fontWeight: FontWeight.bold,
  //                   //                 )),
  //                   //             Divider(
  //                   //               color: Palette.myColor[50],
  //                   //               height: 3,
  //                   //             ),
  //                   //             Text(" ${a.mainStatValue}",
  //                   //                 style: const TextStyle(
  //                   //                   fontSize: 18.0,
  //                   //                   fontWeight: FontWeight.bold,
  //                   //                 )),
  //                   //             Divider(
  //                   //               color: Palette.myColor[50],
  //                   //               height: 3,
  //                   //             ),
  //                   //           ],
  //                   //         ))),
  //                 ],
  //               );
  //             },
  //             itemCount: artifacts.length,
  //           );
  //       }
  //       return const Text('Error occurred trying to list Artifacts.');
  //     },
  //   );
  // }

  //* Get selected Character from Database *
  Widget _futureBuilderCharacter() {
    return FutureBuilder<CharacterModel>(
      future: CharacterService().getCharacter(character.id!),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;
          case ConnectionState.waiting:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  CircularProgressIndicator(),
                  Text('Loading'),
                ],
              ),
            );
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            final CharacterModel character = snapshot.data as CharacterModel;
            return ListView.builder(
              itemBuilder: (context, index) {
                final CharacterModel c = character;
                //String? name = a.name;
                return Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(
                            top: 6.0, bottom: 0.2, left: 1.0, right: 1.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 160,
                              child: _buildCard(widget.name!,
                                  './assets/characters/${c.name}.png'),
                            ),
                            SizedBox(
                              width: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      if (c.level != null)
                                        Text(
                                          "Level: ${c.level}",
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      const SizedBox(height: 15.0),
                                      if (c.critRate != null)
                                        Text("Crit Rate: ${c.critRate}",
                                            style: const TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      const SizedBox(height: 15.0),
                                      if (c.critDmg != null)
                                        Text("Crit Dmg: ${c.critDmg}",
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
                        ))
                  ],
                );
              },
              itemCount: 1,
            );
        }
        return const Text('Error occurred trying to list Artifacts.');
      },
    );
  }

  Widget _buildCard(String name, String imgPath) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 6.0, bottom: 0.2, left: 5.0, right: 5.0),
        child: InkWell(
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
                    tag: 1,
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
