import 'package:clean_note/domain/model/note.dart';
import 'package:clean_note/domain/repository/note_repository.dart';
import 'package:clean_note/domain/use_case/get_notes.dart';
import 'package:clean_note/domain/util/note_order.dart';
import 'package:clean_note/domain/util/order_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_notes_use_case_test.mocks.dart';

@GenerateMocks([NoteRepository])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Timeout timeout = const Timeout(Duration(seconds: 10));

  test('정렬 기능이 잘 동작해야 한다.', () async {
    final repository = MockNoteRepository();
    final getNotesUseCase = GetNotes(repository);

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

    // date(timestamp) 로 정렬
    List<Note> result = await getNotesUseCase(
      const NoteOrder.date(
        OrderType.descending(),
      ),
    );

    expect(result, isA<List<Note>>());
    expect(result.first.timestamp, 2);

    // getNotes 함수가 수행이 되었는지 확인
    verify(repository.getNotes());

    result = await getNotesUseCase(
      const NoteOrder.date(
        OrderType.ascending(),
      ),
    );

    expect(result.first.timestamp, 0);

    verify(repository.getNotes());

    result = await getNotesUseCase(
      const NoteOrder.title(
        OrderType.ascending(),
      ),
    );

    expect(result.first.title, 'title');

    verify(repository.getNotes());

    result = await getNotesUseCase(
      const NoteOrder.title(
        OrderType.descending(),
      ),
    );

    expect(result.first.title, 'title2');

    verify(repository.getNotes());

    result = await getNotesUseCase(
      const NoteOrder.color(
        OrderType.descending(),
      ),
    );

    expect(result.first.color, 2);

    verify(repository.getNotes());

    result = await getNotesUseCase(
      const NoteOrder.color(
        OrderType.ascending(),
      ),
    );

    expect(result.first.color, 1);

    verify(repository.getNotes());

    // expect 하지않고 verify 했기 때문에 에러
    // verify(repository.getNotes());

    // 더 이상 작동안했다면 success
    verifyNoMoreInteractions(repository);
  }, timeout: timeout);
}
