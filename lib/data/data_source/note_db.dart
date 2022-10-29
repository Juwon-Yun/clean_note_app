import 'package:clean_note/domain/model/note.dart';
import 'package:sqflite/sqflite.dart';

class NoteDb {
  Database db;

  NoteDb(this.db);

  Future<Note?> getNoteById(int id) async {
    // sqlflite where 절 이렇게 씀
    // SELECT * FROM note WHERE id = 1
    final List<Map<String, dynamic>> maps = await db.query(
      'note',
      where: 'id = ?',
      whereArgs: [id],
    );

    return null;
  }
}
