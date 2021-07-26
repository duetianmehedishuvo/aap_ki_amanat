import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelpers {
  static final databaseName = 'AAPNAR_AMANOT.db';
  static final databaseVersion = 1;
  static final tableBangla = 'Bangla_Data';
  static final tableEnglish = 'English_Data';
  static final tableHindi = 'Hindi_Data';
  static final tableUrdu = 'Urdu_Data';

  DBHelpers._privateConstrator();

  static final DBHelpers instance = DBHelpers._privateConstrator();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, databaseName);

    var exists = await databaseExists(path);
    if (!exists) {
      print('Copy Database Start');

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", databaseName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      //write
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print('Opening existing database');
    }

    return await openDatabase(path, version: databaseVersion);
  }

  ///////================== CRUD Operation Is Start=================

  //get Select All Data From Bangla Content Blog
  Future<List> getAllBanglaContent() async {
    Database db = await instance.database;
    var result = await db.query(tableBangla);
    return result.toList();
  }

  //get Select All Data From Hindi Content Blog
  Future<List> getAllHindiContent() async {
    Database db = await instance.database;
    var result = await db.query(tableHindi);
    return result.toList();
  }


  //get Select All Data From English Content Blog
  Future<List> getAllEnglishContent() async {
    Database db = await instance.database;
    var result = await db.query(tableEnglish);
    return result.toList();
  }
}
