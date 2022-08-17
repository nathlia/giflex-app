import 'dart:developer';

import 'package:giflex_app/app-core/model/character_artifact.dart';
import 'package:giflex_app/app-core/persistence/open_database.dart';
import 'package:giflex_app/app-core/persistence/open_database.dart';
import 'package:sqflite/sqflite.dart';

class CharacterArtifactPersistence {
  static const String _tableName = 'character_artifact';
  static const String _col_character_id = 'character_id';
  static const String _col_artifact_id = 'artifact_id';

/* 
* character table from database:
 create table character_artifact (
    artifact_id  integer references artifact,
    character_id integer references character,
    primary key (character_id, artifact_id)
);
*/

  add(CharacterArtifact ca) async {
    log('Saving character to artifact: ${ca.characterId}');
    log('Saving artifact to character: ${ca.artifactId}');

    final db = await getDatabase();

    await db.insert(_tableName, ca.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static const createTableArtifactSubstat = ' CREATE TABLE $_tableName ('
      '$_col_character_id integer not null, '
      '$_col_artifact_id integer not null, '
      'primary key (artifact_id, substat_id) '
      ' )';

  Future<List<CharacterArtifact>> getArtifactSubstats() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return CharacterArtifact.fromJson(maps[i]);
    });
  }

  Future close() async {
    var db = await getDatabase();
    db.close();
  }
}
