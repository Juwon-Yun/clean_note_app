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

  Future<void> insertNote(Note note) async {
    // values 에는 toJson 형태가 담기면 된다.
    // 삽입한 row를 리턴받을 수 있다.
    await db.insert('note', note.toJson());
  }

  Future<void> updateNote(Note note) async {
    // 똑같이 count가 리턴된다.
    await db.update(
      'note',
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<void> deleteNote(Note note) async {
    await db.update(
      'note',
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }
}
