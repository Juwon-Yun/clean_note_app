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
      title: (OrderType orderType) {},
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
      color: (OrderType orderType) {},
    );

    // notes.sort((a, b) => -a.timestamp.compareTo(b.timestamp));

    return notes;
  }
}
