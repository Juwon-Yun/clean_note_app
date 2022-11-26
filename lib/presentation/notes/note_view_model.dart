import 'package:clean_note/domain/model/note.dart';
import 'package:clean_note/domain/repository/note_repository.dart';
import 'package:clean_note/domain/use_case/add_note.dart';
import 'package:clean_note/domain/use_case/delete_note.dart' as use_case;
import 'package:clean_note/domain/use_case/get_notes.dart';
import 'package:clean_note/domain/use_case/use_cases.dart';
import 'package:clean_note/domain/util/note_order.dart';
import 'package:clean_note/domain/util/order_type.dart';
import 'package:clean_note/presentation/notes/note_event.dart';
import 'package:clean_note/presentation/notes/notes_state.dart';
import 'package:flutter/material.dart';

// FIXME : refector 1 use case를 사용하지 않는 가정으로 mvvm 패턴 방식을 따른다.
class NotesViewModel with ChangeNotifier {
  // final NoteRepository repository;

  // FIXME : refector 4 use case 사용
  // final GetNotes getNotes;
  // final use_case.DeleteNote deleteNote;
  // final AddNote addNote;

  // FIXME : refector 5 use cases 사용
  final UseCases useCases;

  // FIXME : refector 2
  NotesState _state = NotesState(
    notes: [],
    noteOrder: const NoteOrder.date(
      OrderType.descending(),
    ),
  );
  NotesState get state => _state;

  // List<Note> _notes = [];
  // UnmodifiableListView<Note> get note => UnmodifiableListView(_notes);

  Note? _recentlyDeletedNote;

  // NotesViewModel(this.repository) {
  //   _loadNotes();
  // }

  NotesViewModel(
    this.useCases,
  ) {
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

    List<Note> notes = await useCases.getNotes(
      _state.noteOrder,
    );

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
    // await repository.deleteNote(note);

    // deleteNote(note);

    useCases.deleteNote(note);

    _recentlyDeletedNote = note;

    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      // await repository.insertNote(_recentlyDeletedNote!);

      // addNote.call(_recentlyDeletedNote!);

      useCases.addNote(_recentlyDeletedNote!);

      _recentlyDeletedNote = null;

      _loadNotes();
    }
  }
}
