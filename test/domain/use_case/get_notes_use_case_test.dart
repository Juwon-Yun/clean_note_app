import 'package:clean_note/domain/model/note.dart';
import 'package:clean_note/domain/repository/note_repository.dart';
import 'package:clean_note/domain/use_case/get_notes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_notes_use_case_test.mocks.dart';

@GenerateMocks([NoteRepository])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Timeout timeout = const Timeout(Duration(seconds: 10));

  test('정렬 기능이 잘 동작해야 한다.', () {
    final repository = MockNoteRepository();
    final useCse = GetNotes(repository);

    // 동작 정의
    when(
      repository.getNotes(),
    ).thenAnswer(
      (_) async => [
        // fake data 정의
        Note(
          title: 'title',
          content: 'content',
          color: 1,
          timestamp: 0,
        ),
        Note(
          title: 'title2',
          content: 'content2',
          color: 2,
          timestamp: 2,
        ),
      ],
    );
  }, timeout: timeout);
}
