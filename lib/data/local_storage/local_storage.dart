import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class LocalStorage {
  ///Bu qator LocalStorage klassining yagona obyektini yaratadi va
  ///uni _instance o'zgaruvchisiga saqlaydi. _internal() nomlangan konstruktor chaqirilishi orqali obyekt yaratiladi.
  static final LocalStorage _instance = LocalStorage._internal();

  ///Bu qator _database nomli o'zgaruvchini e'lon qiladi. Bu o'zgaruvchi keyinchalik SQLite ma'lumotlar bazasi bilan bog'lanishni saqlash uchun ishlatiladi.
  static Database? _database;

  ///Bu qator _internal() nomlangan konstruktorni e'lon qiladi. Bu konstruktor private bo'lgani uchun, klassdan tashqarida chaqirilishi mumkin emas. Bu Singleton patternni amalga oshirish uchun ishlatiladi. yani classimizni singilten qilish
  LocalStorage._internal();

  ///Bu qator LocalStorage klassining fabrikasini e'lon qiladi. Fabrika _instance o'zgaruvchisini qaytaradi, bu esa LocalStorage klassining yagona obyektini ifodalaydi.
  factory LocalStorage() => _instance;

  Future<Database> get db async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "user_insert");
    final db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version)async{
        await db.execute("""CREATE TABLE users(id INTEGER PRIMARY KEY A)
        """);
      },
    );
  }


}
