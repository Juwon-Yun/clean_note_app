import 'package:clean_note/domain/model/note.dart';
import 'package:clean_note/domain/repository/note_repository.dart';

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

  Future<List<Note>> call() async {
    List<Note> notes = await repository.getNotes();

    notes.sort((a, b) => -a.timestamp.compareTo(b.timestamp));

    return notes;
  }
}
