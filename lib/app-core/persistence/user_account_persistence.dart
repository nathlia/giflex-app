// ignore_for_file: constant_identifier_names, depend_on_referenced_packages

import 'dart:developer';

import 'package:giflex_app/app-core/model/user_account.dart';
import 'package:giflex_app/app-core/persistence/open_database.dart';
import 'package:sqflite/sqflite.dart';

class UserAccountPersistence {
  static const String _tableName = 'useraccount';
  static const String _col_id = 'id';
  static const String _col_name = 'name';
  static const String _col_username = 'username';
  static const String _col_password = 'password';
  static const String _col_token = 'token';
  static const String _col_is_admin = 'is_admin';

  /* 
    * character table from database:
    create table useraccount (
        id integer not null primary key,
        is_admin boolean default false,
        name     varchar(255),
        password varchar(255),
        token    varchar(255),
        username varchar(255) not null constraint unique
    );
  */
  static const createTableUserAccount = ' CREATE TABLE $_tableName ('
      '$_col_id integer not null primary key, '
      '$_col_name text, '
      '$_col_username text not null unique, '
      '$_col_password text, '
      '$_col_token text'
      '$_col_is_admin boolean default false'
      ' )';

  add(UserAccountModel u) async {
    log('Saving character: ${u.username}');

    final db = await getDatabase();

    await db.insert(_tableName, u.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<UserAccountModel>> getUserAccounts() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return UserAccountModel.fromJson(maps[i]);
    });
  }

  Future close() async {
    var db = await getDatabase();
    db.close();
  }
}
