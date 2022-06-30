import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard(name, './assets/characters/$name.png'),
                  _buildCard(
                    'Tartaglia',
                    './assets/characters/Tartaglia.png',
                  ),
                  _buildCard('Albedo', './assets/characters/Albedo.png'),
                  _buildCard('Diluc', './assets/characters/Diluc.png'),
                  _buildCard('Zhongli', './assets/characters/Zhongli.png'),
                  _buildCard('Kazuha', './assets/characters/Kazuha.png'),
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
                    Modular.to.pushNamed('/artifact-set-show');
                  },
                  child: const Text('Xiao'),
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
                        debugPrint('Pressed Login Simple');
                        Modular.to.navigate('/home');
                      },
                      child: const Text('Login Simple')))
            ],
          )
        ],
      ),
    );
  }
}

Widget _buildCard(String name, String imgPath) {
  return Padding(
      padding:
          const EdgeInsets.only(top: 10.0, bottom: 0.2, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Modular.to.pushNamed('/artifact-set-show/');
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
