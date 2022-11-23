import 'package:clean_note/domain/use_case/add_note.dart';
import 'package:clean_note/domain/use_case/delete_note.dart';
import 'package:clean_note/domain/use_case/get_notes.dart';
import 'package:clean_note/domain/use_case/update_note.dart';

class UseCases {
  final AddNote addNote;
  final DeleteNote deleteNote;
  final GetNotes getNotes;
  final UpdateNote updateNote;

  UseCases({
    required this.addNote,
    required this.deleteNote,
    required this.getNotes,
    required this.updateNote,
  });
}
