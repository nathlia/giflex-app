import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/app-core/model/character.dart';
import 'package:giflex_app/app-core/persistence/character_persistence.dart';
import 'package:giflex_app/app-core/service/character_service.dart';
import 'package:giflex_app/router.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = "Xiao";

  @override
  Widget build(BuildContext context) {
    // CharacterModel c;
    // c = CharacterModel(
    //     id: 1, name: 'Xiao', level: '90', critRate: '78.5', critDmg: '186.6');
    // CharacterPersistence().add(c);
    return Scaffold(
      backgroundColor: Palette.myColor[400],
      appBar: AppBar(
        title: const Text('Characters'),
        backgroundColor: Palette.myColor[300],
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 20.0),
        children: <Widget>[
          const SizedBox(height: 15.0),
          const Text('Select a character',
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold)),
          Container(
              padding: const EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: _futureBuilderCharacter()),
        ],
      ),
    );
  }
}

//* Gets Characters from Database *
Widget _futureBuilderCharacter() {
  return FutureBuilder<List<CharacterModel>>(
    future: CharacterService().getAllCharacters(),
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
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  final CharacterModel c = characters[index];
                  String? name = c.name;
                  log('$name');
                  return _charactersTray(c);
                },
                itemCount: characters.length,
              ))
            ],
          );
      }
      return const Text('Error occurred trying to list Characters.');
    },
  );
}

Widget _charactersTray(CharacterModel character) {
  return GridView.count(
    shrinkWrap: true,
    crossAxisCount: 2,
    primary: false,
    crossAxisSpacing: 10.0,
    mainAxisSpacing: 10.0,
    childAspectRatio: 0.8,
    children: <Widget>[
      _buildCard(character, './assets/characters/${character.name}.png')
    ],
  );
}

Widget _buildCard(CharacterModel character, String imgPath) {
  return Padding(
      padding:
          const EdgeInsets.only(top: 10.0, bottom: 0.2, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Modular.to.pushNamed(
              '/artifact-set-show/${character.name}/${character.id}',
              arguments: character);
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
                      height: 163.0,
                      width: 250.0,
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
                        character.name!,
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
