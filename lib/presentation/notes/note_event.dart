import 'package:clean_note/domain/model/note.dart';
import 'package:clean_note/domain/util/note_order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_event.freezed.dart';

@freezed
abstract class NotesEvent with _$NotesEvent {
  const factory NotesEvent.loadNotes() = LoadNotes;
  const factory NotesEvent.deleteNote(Note note) = DeleteNote;
  const factory NotesEvent.restoreNote() = RestoreNote; // undo
  const factory NotesEvent.changeOrder(NoteOrder noteOrder) =
      ChangeOrder; // undo
}
