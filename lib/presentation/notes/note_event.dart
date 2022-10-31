import 'package:clean_note/domain/model/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_event.freezed.dart';

@freezed
abstract class NotesEvent with _$NotesEvent {
  const factory NotesEvent.loadNotes() = LoadNotes;
  const factory NotesEvent.deleteNote(Note note) = DeleteNote;
  const factory NotesEvent.restoreNote(Note note) = RestoreNote; // undo
}
