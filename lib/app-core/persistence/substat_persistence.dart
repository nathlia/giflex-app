// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:giflex_app/app-core/model/artifact_set_type.dart';
import 'package:giflex_app/app-core/model/substat.dart';
import 'package:giflex_app/app-core/persistence/open_database.dart';
import 'package:sqflite/sqflite.dart';

class SubstatPersistence {
  static const String _tableName = 'substat';
  static const String _col_id = 'id';
  static const String _col_name = 'name';

  /* 
  * character table from database:
    create table substat (
    id integer not null primary key,
    name varchar(255)
  );
  */

  //creates table and insert the artifacts sets
  static const createTableSubstatModel = " CREATE TABLE $_tableName ("
      "$_col_id integer not null primary key, "
      "$_col_name text "
      " )";

  Future<List<SubstatModel>> getArtifactSetType() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return SubstatModel.fromJson(maps[i]);
    });
  }

  Future close() async {
    var db = await getDatabase();
    db.close();
  }
}
