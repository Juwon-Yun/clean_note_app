import 'package:clean_note/domain/model/note.dart';

abstract class NoteRepository {
  Future<List<Note>> getNotes();

  Future<Note> getNoteById(int id);

  Future<void> insertNote(Note note);

  Future<Note> updateNote(Note note);

  Future<Note> deleteNote(Note note);
}
