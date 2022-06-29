import 'package:flutter/material.dart';
import 'package:giflex_app/router.dart';

class CharaCard extends StatefulWidget {
  const CharaCard({Key? key, required this.name, required this.imgPath})
      : super(key: key);

  final String name;
  final String imgPath;

  @override
  State<CharaCard> createState() => _CharaCardState();
}

class _CharaCardState extends State<CharaCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
          onTap: () {},
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
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                    )),
              ],
            ),
          ),
        ));
  }
}
