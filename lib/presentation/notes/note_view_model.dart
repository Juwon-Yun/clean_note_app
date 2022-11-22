import 'package:clean_note/domain/model/note.dart';
import 'package:clean_note/domain/repository/note_repository.dart';
import 'package:clean_note/domain/use_case/get_notes.dart';
import 'package:clean_note/presentation/notes/note_event.dart';
import 'package:clean_note/presentation/notes/notes_state.dart';
import 'package:flutter/material.dart';

// FIXME : refector 1 use case를 사용하지 않는 가정으로 mvvm 패턴 방식을 따른다.
class NotesViewModel with ChangeNotifier {
  // final NoteRepository repository;

  final GetNotes getNotes;

  // FIXME : refector 2
  NotesState _state = NotesState(notes: []);
  NotesState get state => _state;

  // List<Note> _notes = [];
  // UnmodifiableListView<Note> get note => UnmodifiableListView(_notes);

  Note? _recentlyDeletedNote;

  // NotesViewModel(this.repository) {
  //   _loadNotes();
  // }

  NotesViewModel(this.getNotes) {
    _loadNotes();
  }

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
    );
  }

  Future<void> _loadNotes() async {
    // call 생략
    // List<Note> notes = await getNotes.call();
    List<Note> notes = await getNotes();

    // FIXME : refector 3
    // List<Note> notes = await repository.getNotes();

    // FIXME : refector 3
    // 오름차순 정렬
    // notes.sort((a, b) => a.timestamp.compareTo(b.timestamp));

    // 내림차순 정렬
    // notes.sort((a, b) => -a.timestamp.compareTo(b.timestamp));

    // FIXME : refector 1
    // _notes = notes;

    // FIXME : refector 2
    _state = state.copyWith(notes: notes);
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await repository.deleteNote(note);

    _recentlyDeletedNote = note;

    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await repository.insertNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      _loadNotes();
    }
  }
}
