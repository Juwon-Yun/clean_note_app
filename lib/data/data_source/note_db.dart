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

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    }

    return null;
  }

  Future<List<Note>> getNotes() async {
    // 조건 없이 note 테이블만 명시하면 전부다 가져온다.
    final maps = await db.query('note');

    return maps.map((e) => Note.fromJson(e)).toList();
  }
}
