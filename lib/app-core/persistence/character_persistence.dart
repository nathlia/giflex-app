// ignore_for_file: constant_identifier_names, depend_on_referenced_packages

import 'dart:developer';

import 'package:giflex_app/app-core/model/character.dart';
import 'package:giflex_app/app-core/persistence/open_database.dart';
import 'package:sqflite/sqflite.dart';

class CharacterPersistence {
  static const String _tableName = 'character';
  static const String _col_id = 'id';
  static const String _col_name = 'name';
  static const String _col_level = 'level';
  static const String _col_critrate = 'critRate';
  static const String _col_critdmg = 'critDmg';
/* 
* character table from database:
  create table character ( id integer not null primary key, critdmg text, 
  critrate text, level text, name text, is_hidden boolean, rarity integer);
*/

  static const createTableCharacter = ' CREATE TABLE $_tableName ('
      '$_col_id integer not null primary key, '
      '$_col_name text, '
      '$_col_level text, '
      '$_col_critrate text, '
      '$_col_critdmg text'
      ' )';

  add(CharacterModel c) async {
    log('Saving character: ${c.name}');

    final db = await getDatabase();

    await db.insert(_tableName, c.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CharacterModel>> getCharacters() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return CharacterModel.fromJson(maps[i]);
    });
  }

  Future close() async {
    var db = await getDatabase();
    db.close();
  }
}
