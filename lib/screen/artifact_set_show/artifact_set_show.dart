import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/app-core/model/artifact.dart';
import 'package:giflex_app/app-core/model/artifact_set_type.dart';
import 'package:giflex_app/app-core/model/character.dart';
import 'package:giflex_app/app-core/persistence/character_persistence.dart';
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
  // String name = "Xiao";
  // int level = 90;
  // double critRate = 76.9;
  // double critDmg = 186.5;

  int id = 1;
  String artifactType = "Flower";
  String artifactSetType = "Gladiator's Finale";
  String mainstat = "HP";
  double mainStatValue = 2000;

  @override
  Widget build(BuildContext context) {
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
                  Modular.to.pushNamed('/character/');
                },
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 166,
                      child: _buildCard(widget.name!,
                          './assets/characters/${widget.name}.png'),
                    ),
                    SizedBox(
                      width: 216,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text("Level: ${widget.character!.level}",
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(height: 15.0),
                              Text("Crit Rate: ${widget.character!.critRate}",
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(height: 15.0),
                              Text("Crit Dmg: ${widget.character!.critDmg}",
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
                      Text(" ${widget.character!.name}",
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

  //* Gets Characters from Database *
  Widget _futureBuilderCharacter() {
    return FutureBuilder<List<CharacterModel>>(
      future: CharacterPersistence().getCharacters(),
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
            final List<CharacterModel> characters =
                snapshot.data as List<CharacterModel>;
            return ListView.builder(
              itemBuilder: (context, index) {
                final CharacterModel c = characters[index];
                String? name = c.name;
                return Row(
                  children: [
                    SizedBox(
                      width: 166,
                      child: _buildCard(
                          name!, './assets/characters/${{c.name}}.png'),
                    ),
                    SizedBox(
                      width: 216,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text("Level: $c.level",
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(height: 15.0),
                              Text("Crit Rate: $c.critRate",
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(height: 15.0),
                              Text("Crit Dmg: $c.critDmg",
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
                );
              },
              itemCount: characters.length,
            );
        }
        return const Text('Error occurred trying to list Characters.');
      },
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
