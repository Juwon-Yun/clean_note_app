import 'package:clean_note/data/data_source/note_db_helper.dart';
import 'package:clean_note/domain/model/note.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  test('sqflite db 테스트가 잘 되어야 한다.', () async {
    // 메모리 임시 db 데이터 생성
    // test를 실행할 때 마다 새로 메모리에 만든다.
    // 실제 db랑 다르게 지워줘야하는 번거로움이 없음
    final db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);

    // row sql을 직접 사용할 수 있음
    await db.execute(
        'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)');

    final noteDbHelper = NoteDbHelper(db);

    await noteDbHelper.insertNote(
      Note(title: 'test', content: 'test', color: 1, timestamp: 1),
    );

    expect(
      (await noteDbHelper.getNotes()).length,
      1,
    );

    Note note = (await noteDbHelper.getNoteById(1))!;

    expect(
      note.id,
      1,
    );

    // freezed 에서 지원하는 copyWith를 사용한다.
    await noteDbHelper.updateNote(
      note.copyWith(title: 'change'),
    );

    note = (await noteDbHelper.getNoteById(1))!;

    expect(
      note.title,
      'change',
    );

    await noteDbHelper.deleteNote(note);

    expect(
      (await noteDbHelper.getNotes()).length,
      0,
    );

    await db.close();
  });
}
