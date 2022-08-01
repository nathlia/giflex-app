import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/router.dart';

class Images extends StatefulWidget {
  const Images({Key? key}) : super(key: key);

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  String name = "Xiao";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.myColor[400],
        appBar: AppBar(
          title: const Text('Images'),
          backgroundColor: Palette.myColor[300],
        ),
        body: SingleChildScrollView(
            child: InkWell(
          onTap: () {
            Modular.to.pushNamed('/showcase/');
          },
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                      left: 5.0, top: 20, bottom: 20, right: 5.0),
                  child: Image.asset(
                    './assets/showcase/Xiao/1.png',
                    height: 202,
                    width: 700,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 5.0, top: 20, bottom: 20, right: 5.0),
                  child: Image.asset(
                    './assets/showcase/Xiao/2.png',
                    height: 202,
                    width: 700,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 5.0, top: 20, bottom: 20, right: 5.0),
                  child: Image.asset(
                    './assets/showcase/Xiao/3.png',
                    height: 202,
                    width: 700,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 5.0, top: 20, bottom: 20, right: 5.0),
                  child: Image.asset(
                    './assets/showcase/Xiao/4.png',
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

// class Images extends StatelessWidget {
//   const Images({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Palette.myColor[400],
//         appBar: AppBar(
//           title: const Text('Images'),
//           backgroundColor: Palette.myColor[300],
//         ),
//         body: 
//         SingleChildScrollView(
//           child: Column(
//             //crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   Container(
//                     padding: const EdgeInsets.symmetric(vertical: 50.0),
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         elevation: 5,
//                       ),
//                       onPressed: () {
//                         log('Pressed');
//                         //int id = 1;
//                         Modular.to.pushNamed('/showcase');
//                       },
//                       child: const Text('Showcase'),
//                     ),
//                   )
//                 ],
//               ),
//               Column(
//                 children: <Widget>[
//                   Container(
//                       padding: const EdgeInsets.symmetric(vertical: 50.0),
//                       width: double.infinity,
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             elevation: 5,
//                           ),
//                           onPressed: () {
//                             //onClickLogin(context);
//                             debugPrint('Artifact');
//                             Modular.to.navigate('/artifact-set-show');
//                           },
//                           child: const Text('Cancel')))
//                 ],
//               )
//             ],
//           ),
//         ));
//   }
// }
