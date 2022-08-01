// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';
import 'package:giflex_app/app-core/persistence/artifact_persistence.dart';
import 'package:giflex_app/app-core/persistence/artifact_set_type_persistence.dart';
import 'package:giflex_app/app-core/persistence/artifact_substat_persistence.dart';
import 'package:giflex_app/app-core/persistence/artifact_type_persistence.dart';
import 'package:giflex_app/app-core/persistence/character_persistence.dart';
import 'package:giflex_app/app-core/persistence/substat_persistence.dart';
import 'package:giflex_app/app-core/persistence/user_account_persistence.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  log('opening DB connection');
  return openDatabase(join(await getDatabasesPath(), 'giflex9.db'),
      onCreate: (db, version) async {
    List<String> query = [
      CharacterPersistence.createTableCharacter,
      ArtifactPersistence.createTableArtifact,
      ArtifactSetTypePersistence.createTableArtifactSetType,
      ArtifactTypePersistence.createTableArtifactType,
      ArtifactSubstatPersistence.createTableArtifactSubstat,
      UserAccountPersistence.createTableUserAccount,
      SubstatPersistence.createTableSubstatModel
    ];

    log('getDatabasesPath(): $getDatabasesPath()');
    for (String sql in query) {
      log('sql: $sql');

      db.execute(sql);
    }
  }, version: 9);
}
