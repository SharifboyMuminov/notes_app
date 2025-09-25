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

  Future<NetworkResponse> insertNotes(NotesModel personModel) async {
    NetworkResponse myResponse = NetworkResponse();

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

  Future<NetworkResponse> getAllNotes() async {
    NetworkResponse myResponse = NetworkResponse();

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
  Future<NetworkResponse> deleteNotes(List<NotesModel> noteModels) async {
    NetworkResponse myResponse = NetworkResponse();

    try {
      final db = await databaseInstance.database;

      // Extract the IDs from the noteModels list
      List<int> noteIds = noteModels.map((note) => note.id!).toList();

      // Create a placeholder string for the number of IDs
      String placeholders = List.filled(noteIds.length, '?').join(',');

      // Execute the delete query using the IN clause
      myResponse.data = await db.delete(
        NotesConstanse.tableName,
        where: "${NotesConstanse.id} IN ($placeholders)",
        whereArgs: noteIds,
      );
    } catch (error) {
      myResponse.errorText = error.toString();
    }

    return myResponse;
  }


  Future<NetworkResponse> updateNotes({required NotesModel noteModel}) async {
    NetworkResponse myResponse = NetworkResponse();

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

  Future<NetworkResponse> searchNotes(String query) async {
    NetworkResponse myResponse = NetworkResponse();

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
