import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../static_members/strings.dart';

class LocalDB {
  static Database? _db;

  Future<Database?> get database async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDB();
      return _db;
    }
  }

  initDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'localDB.db');
    var db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createTables(db);
    });
    return db;
  }

  Future<void> createTables(Database db) async {
    await db.execute(Strings.sqlTableUsers);
    await db.execute(Strings.sqlTableLogin);
    await db.execute(Strings.sqlTableSuppliers);
    await db.execute(Strings.sqlTableSupplierTransactions);
    await db.execute(Strings.sqlTableClients);
    await db.execute(Strings.sqlTableClientTransactions);
  }

  Future<int?> insert(
      {required String table, required Map<String, dynamic> values}) async {
    Database? db = await database;
    return await db?.insert(table, values);
  }

  Future<List<Map<String, Object?>>?> retrieve({required String sql}) async {
    Database? db = await database;
    return await db?.rawQuery(sql);
  }

  Future<int?> update({required String sql}) async {
    Database? db = await database;
    return await db?.rawUpdate(sql);
  }

  Future<int?> delete({required String sql}) async {
    Database? db = await database;
    return await db?.rawDelete(sql);
  }
}
