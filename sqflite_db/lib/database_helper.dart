import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_db/tools.dart';

class DatabaseHelper{


  //single tone design pattern
  DatabaseHelper._privateConstructor();

  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async => _database ??= await _initialDatabase();

  Future<Database> _initialDatabase() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path,'tools.db');
    return await openDatabase(
        version:1,
        onCreate:_onCreate,
        path
    );
  }

  Future _onCreate(Database db ,int version ) async{

    await db.execute(''' 
    CREATE TABLE Tools(
    id INTEGER PRIMARY KEY
    name TEXT
    )
    ''');

  }

 Future <List<Tools>> getTools() async{

    Database db = await instance.database;

    var tools = await db.query('tools' , orderBy: 'name');
    List<Tools> toolList = tools.isNotEmpty ? tools.map((e) => Tools.fromMap(e)).toList() : [] ;

    return toolList;

 }



}