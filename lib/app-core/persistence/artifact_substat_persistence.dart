// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:giflex_app/app-core/model/artifact_substat.dart';
import 'package:giflex_app/app-core/persistence/open_database.dart';
import 'package:sqflite/sqflite.dart';

class ArtifactSubstatPersistence {
  static const String _tableName = 'artifact_substat';
  static const String _col_artifact_id = 'artifact_id';
  static const String _col_substat_id = 'substat_id';
  static const String _col_substatvalue = 'substatvalue';
/* 
* character table from database:
 create table artifact_substat(
    substatvalue double precision,
    substat_id   integer not null constraint references substat,
    artifact_id  integer not null constraint references artifact,
    primary key (artifact_id, substat_id)
    );
*/

  static const createTableArtifactSubstat = ' CREATE TABLE $_tableName ('
      '$_col_artifact_id integer not null, '
      '$_col_substat_id integer not null, '
      '$_col_substatvalue double precision, '
      'primary key (artifact_id, substat_id) '
      ' )';

  Future<void> add(ArtifactSubstatModel a) async {
    log('Saving substat to artifact: $_col_artifact_id');
    log('Saving substat: ${a.substat.name}');
    log('Saving substat value to artifact: ${a.substatValue}');

    final db = await getDatabase();

    await db.insert(_tableName, a.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ArtifactSubstatModel>> getArtifactSubstats() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    List.generate(maps.length, (i) {
      return ArtifactSubstatModel.fromJson(maps[i]);
    });
    throw Exception();
  }

  Future close() async {
    var db = await getDatabase();
    db.close();
  }
}
