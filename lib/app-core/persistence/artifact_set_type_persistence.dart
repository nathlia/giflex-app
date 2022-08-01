// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:giflex_app/app-core/model/artifact_set_type.dart';
import 'package:giflex_app/app-core/persistence/open_database.dart';
import 'package:sqflite/sqflite.dart';

class ArtifactSetTypePersistence {
  static const String _tableName = 'artifactsettype';
  static const String _col_id = 'id';
  static const String _col_name = 'name';
  static const String _col_twopieces = 'twopieces';
  static const String _col_fourpieces = 'fourpieces';

  /* 
  * character table from database:
    create table artifactsettype (
      id integer not null primary key,
      name varchar(255),
      fourpieces varchar(2000),
      twopieces varchar(1000)
    );

      "INSERT INTO artifactsettype (id, name, fourpieces, twopieces) VALUES (1,   'Viridescent Veneerer', 'Increases Swirl DMG by 60%. Decreases opponent''s Elemental RES to the element infused in the Swirl by 40% for 10s.', 'Anemo DMG Bonus +15%');"
      "INSERT INTO artifactsettype (id, name, fourpieces, twopieces) VALUES (11,  'Gladiator''s Finale', 'If the wielder of this artifact set uses a Sword, Claymore or Polearm, increases their Normal Attack DMG by 35%.', 'ATK +18%'); "
      "INSERT INTO artifactsettype (id, name, fourpieces, twopieces) VALUES (12,  'Husk of Opulent Dreams', 'A character equipped with this Artifact set will obtain the Curiosity effect in the following conditions: When on the field, the character gains 1 stack after hitting an opponent with a Geo attack, triggering a maximum of once every 0.3s. When off the field, the character gains 1 stack every 3s. Curiosity can stack up to 4 times, each providing 6% DEF and a 6% Geo DMG Bonus. When 6 seconds pass without gaining a Curiosity stack, 1 stack is lost.', 'DEF +30%'); "
      "INSERT INTO artifactsettype (id, name, fourpieces, twopieces) VALUES (14,  'Crimson Witch of Flames', 'Increases Overloaded and Burning DMG by 40%. Increases Vaporize and Melt DMG by 15%. Using an Elemental Skill increases the 2-Piece Set Bonus by 50% of its starting value for 10s. Max 3 stacks.', 'Pyro DMG Bonus +15%'); "
      "INSERT INTO artifactsettype (id, name, fourpieces, twopieces) VALUES (15,  'Noblesse Oblige', 'Using an Elemental Burst increases all party members'' ATK by 20% for 12s. This effect cannot stack.', 'Elemental Burst DMG +20%');"
      "INSERT INTO artifactsettype (id, name, fourpieces, twopieces) VALUES (16,  'Heart of Depth', 'After using an Elemental Skill, increases Normal Attack and Charged Attack DMG by 30% for 15s.', 'Hydro DMG Bonus +15%'); "
      "INSERT INTO artifactsettype (id, name, fourpieces, twopieces) VALUES (17,  'Ocean-Hued Clam', 'When the character equipping this artifact set heals a character in the party, a Sea-Dyed Foam will appear for 3 seconds, accumulating the amount of HP recovered from healing (including overflow healing). At the end of the duration, the Sea-Dyed Foam will explode, dealing DMG to nearby opponents based on 90% of the accumulated healing. (This DMG is calculated similarly to Reactions such as Electro-Charged, and Superconduct, but it is not affected by Elemental Mastery, Character Levels, or Reaction DMG Bonuses). Only one Sea-Dyed Foam can be produced every 3.5 seconds. Each Sea-Dyed Foam can accumulate up to 30,000 HP (including overflow healing). There can be no more than one Sea-Dyed Foam active at any given time. This effect can still be triggered even when the character who is using this artifact set is not on the field.', 'Healing Bonus +15%.'); "
      "INSERT INTO artifactsettype (id, name, fourpieces, twopieces) VALUES (259, 'Emblem of Severed Fate', 'Increases Elemental Burst DMG by 25% of Energy Recharge. A maximum of 75% bonus DMG can be obtained in this way.', 'Energy Recharge +20%');"
      "INSERT INTO artifactsettype (id, name, fourpieces, twopieces) VALUES (282, 'Shimenawa''s Reminiscence', 'When casting an Elemental Skill, if the character has 15 or more Energy, they lose 15 Energy and Normal/Charged/Plunging Attack DMG is increased by 50% for 10s. This effect will not trigger again during that duration.', 'ATK +18%'); "
  */

  //creates table and insert the artifacts sets
  static const createTableArtifactSetType = " CREATE TABLE $_tableName ("
      "$_col_id integer not null primary key, "
      "$_col_name text, "
      "$_col_twopieces text, "
      "$_col_fourpieces text), "
      " )";

  Future<List<ArtifactSetTypeModel>> getArtifactSetType() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    List.generate(maps.length, (i) {
      return ArtifactSetTypeModel.fromJson(maps[i]);
    });
    throw Exception();
  }

  Future close() async {
    var db = await getDatabase();
    db.close();
  }
}
