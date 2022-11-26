import 'package:clean_note/domain/model/note.dart';
import 'package:clean_note/domain/repository/note_repository.dart';
import 'package:clean_note/domain/util/note_order.dart';
import 'package:clean_note/domain/util/order_type.dart';

// enum NoteOrder {
//   title,
//   date,
//   color,
// }

// enum OrderType {
//   ascending,
//   descending,
// }

class GetNotes {
  final NoteRepository repository;

  GetNotes(this.repository);

  Future<List<Note>> call(NoteOrder noteOrder) async {
    List<Note> notes = await repository.getNotes();

    noteOrder.when(
      title: (OrderType orderType) {
        orderType.when(
          ascending: () {
            notes.sort((a, b) => a.title.compareTo(b.title));
          },
          descending: () {
            notes.sort((a, b) => -a.title.compareTo(b.title));
          },
        );
      },
      date: (OrderType orderType) {
        orderType.when(
          ascending: () {
            notes.sort((a, b) => a.timestamp.compareTo(b.timestamp));
          },
          descending: () {
            notes.sort((a, b) => -a.timestamp.compareTo(b.timestamp));
          },
        );
      },
      color: (OrderType orderType) {
        orderType.when(
          ascending: () {
            // color 값이 int 라서 비교가 가능하다
            notes.sort((a, b) => a.color.compareTo(b.color));
          },
          descending: () {
            notes.sort((a, b) => -a.color.compareTo(b.color));
          },
        );
      },
    );

    // notes.sort((a, b) => -a.timestamp.compareTo(b.timestamp));

    return notes;
  }
}
