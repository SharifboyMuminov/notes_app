import 'package:mynotes/data/model/notes_model.dart';
import 'package:mynotes/data/model/sqflite_response.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static final databaseInstance = LocalDatabase._();

  LocalDatabase._();

  factory LocalDatabase() {
    return databaseInstance;
  }

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _init("todo.db");
      return _database!;
    }
  }

  Future<Database> _init(String databaseName) async {
    String internalPath = await getDatabasesPath();
    String path = join(internalPath, databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";

    await db.execute('''CREATE TABLE ${NotesConstanse.tableName} (
      ${NotesConstanse.id} $idType,
      ${NotesConstanse.date} $textType,
      ${NotesConstanse.createDate} $textType,
      ${NotesConstanse.description} $textType,
      ${NotesConstanse.name} $textType,
      ${NotesConstanse.color} $textType
    )''');
  }

  Future<SqfliteResponse> insertNotes(NotesModel personModel) async {
    SqfliteResponse myResponse = SqfliteResponse();

    try {
      final db = await databaseInstance.database;

      int savedTaskID =
          await db.insert(NotesConstanse.tableName, personModel.toJson());

      myResponse.data = personModel.copyWith(id: savedTaskID);
    } catch (error) {
      myResponse.errorText = error.toString();
    }

    return myResponse;
  }

  Future<SqfliteResponse> getAllNotes() async {
    SqfliteResponse myResponse = SqfliteResponse();

    try {
      final db = await databaseInstance.database;
      String orderBy = "${NotesConstanse.id} DESC";
      List json = await db.query(NotesConstanse.tableName, orderBy: orderBy);
      myResponse.data = json.map((e) => NotesModel.fromJson(e)).toList();
    } catch (error) {
      myResponse.errorText = error.toString();
    }

    return myResponse;
  }

  Future<SqfliteResponse> deleteNotes(NotesModel noteModel) async {
    SqfliteResponse myResponse = SqfliteResponse();

    try {
      final db = await databaseInstance.database;
      myResponse.data = await db.delete(
        NotesConstanse.tableName,
        where: "${NotesConstanse.id} = ?",
        whereArgs: [noteModel.id],
      );
    } catch (error) {
      myResponse.errorText = error.toString();
    }

    return myResponse;
  }

  Future<SqfliteResponse> updateNotes({required NotesModel noteModel}) async {
    SqfliteResponse myResponse = SqfliteResponse();

    try {
      final db = await databaseInstance.database;
      // debugPrint(noteModel.id.toString());

      myResponse.data = await db.update(
          NotesConstanse.tableName, noteModel.toJsonForUpdate(),
          where: "${NotesConstanse.id} = ?", whereArgs: [noteModel.id]);
    } catch (error) {
      myResponse.errorText = error.toString();
    }

    return myResponse;
  }

  Future<SqfliteResponse> searchNotes(String query) async {
    SqfliteResponse myResponse = SqfliteResponse();

    try {
      final db = await databaseInstance.database;

      var json = await db.query(NotesConstanse.tableName,
          where: "${NotesConstanse.name} LIKE ?", whereArgs: ["$query%"]);

      myResponse.data = json.map((e) => NotesModel.fromJson(e)).toList();
    } catch (error) {
      myResponse.errorText = error.toString();
    }

    return myResponse;
  }
}
