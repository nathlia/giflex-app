// ignore_for_file: constant_identifier_names

import 'package:giflex_app/app-core/model/artifact_set_type.dart';
import 'package:giflex_app/app-core/model/artifact_type.dart';
import 'package:giflex_app/app-core/persistence/open_database.dart';
import 'package:sqflite/sqflite.dart';

class ArtifactTypePersistence {
  static const String _tableName = 'artifacttype';
  static const String _col_id = 'id';
  static const String _col_name = 'name';

  /* 
  * character table from database:
    create table artifacttype (
      id   integer not null primary key,
      name varchar(255)
    );
    "INSERT INTO artifacttype (id, name) VALUES (1, 'Flower') "
    "INSERT INTO artifacttype (id, name) VALUES (2, 'Plume') "
    "INSERT INTO artifacttype (id, name) VALUES (3, 'Sands') "
    "INSERT INTO artifacttype (id, name) VALUES (4, 'Goblet') "
    "INSERT INTO artifacttype (id, name) VALUES (5, 'Circlet')"
    ";"
  */
  static const createTableArtifactType = " CREATE TABLE $_tableName ("
      "$_col_id integer not null primary key, "
      "$_col_name text, "
      " ) ";

  Future<List<ArtifactSetTypeModel>> getArtifactType() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    List.generate(maps.length, (i) {
      return ArtifactTypeModel.fromJson(maps[i]);
    });
    throw Exception();
  }

  Future close() async {
    var db = await getDatabase();
    db.close();
  }
}
