import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class SqlDb {
  // Country Table
  static const String countryTable = "country";
  // Country Code Column
  static const String countryId = "country_id";
  static const String countryName = "country_name";
  static const String countryShortName = "country_short_name";

  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = p.join(databasepath, 'holidays.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {}

  deleteMyDataBase() async {
    String databasepath = await getDatabasesPath();
    String path = p.join(databasepath, 'holidays.db');
    var x = await deleteDatabase(path);
    return x;
  }

  _onCreate(Database db, int version) async {
    await db.execute("""CREATE TABLE ${SqlDb.countryTable} (
    ${SqlDb.countryId} INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        ${SqlDb.countryName} varchar(50),
        ${SqlDb.countryShortName} varchar(50)       
)""");
  }

//Select
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  //insert data
  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }
}
