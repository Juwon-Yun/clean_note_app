import 'package:clean_note/domain/model/note.dart';
import 'package:clean_note/domain/repository/note_repository.dart';
import 'package:clean_note/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:clean_note/ui/colors.dart';
import 'package:flutter/material.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteRepository repository;

  int _color = roseBud.value;
  int get color => _color;

  AddEditNoteViewModel(this.repository);

  void onEvent(AddEditNoteEvent event) {
    event.when(
      changeColor: _changeColor,
      saveNote: _saveNote,
    );
  }

  Future<void> _changeColor(int color) async {
    _color = color;
    notifyListeners();
  }

  Future<void> _saveNote(int? id, String title, String content) async {
    if (id == null) {
      // insert
      await repository.insertNote(
        Note(
            title: title,
            content: content,
            color: _color,
            timestamp: DateTime.now().millisecondsSinceEpoch),
      );
    } else {
      // update
      await repository.updateNote(
        Note(
            id: id,
            title: title,
            content: content,
            color: color,
            timestamp: DateTime.now().millisecondsSinceEpoch),
      );
    }
  }
}
