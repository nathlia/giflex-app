// ignore_for_file: constant_identifier_names, depend_on_referenced_packages
import 'dart:developer';

import 'package:giflex_app/app-core/model/artifact.dart';
import 'package:giflex_app/app-core/persistence/open_database.dart';
import 'package:sqflite/sqflite.dart';

class ArtifactPersistence {
  static const String _tableName = 'artifact';
  static const String _col_id = 'id';
  static const String _col_artifactsettypeid = 'artifactsettypeid';
  static const String _col_artifacttypeid = 'artifacttypeid';
  static const String _col_mainstatid = 'mainstatid';
  static const String _col_mainstatvalue = 'mainstatvalue';
  static const String _col_is_equipped = 'is_equipped';

  /* 
  * character table from database:
    create table artifact (
      id integer not null primary key,
      artifactsettypeid integer  references artifactsettype,
      artifacttypeid integer constraint references artifacttype,
      mainstatid integer constraint references substat,
      mainstatvalue double precision,
      is_equipped boolean
    );
  */
  static const createTableArtifact = ' CREATE TABLE $_tableName ('
      '$_col_id integer not null primary key, '
      '$_col_artifactsettypeid integer, '
      '$_col_artifacttypeid integer, '
      '$_col_mainstatid integer, '
      '$_col_mainstatvalue double precision'
      '$_col_is_equipped boolean'
      ' )';

  add(ArtifactModel a) async {
    log('Saving artifact: ${a.id}');

    final db = await getDatabase();

    await db.insert(_tableName, a.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ArtifactModel>> getArtifacts() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return ArtifactModel.fromJson(maps[i]);
    });
  }

  Future close() async {
    var db = await getDatabase();
    db.close();
  }
}
