import 'dart:async';

import 'package:clean_note/domain/model/note.dart';
import 'package:clean_note/domain/repository/note_repository.dart';
import 'package:clean_note/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:clean_note/presentation/add_edit_note/add_edit_note_ui_event.dart';
import 'package:clean_note/ui/colors.dart';
import 'package:flutter/material.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteRepository repository;

  int _color = roseBud.value;
  int get color => _color;

  // event 발생할 때 마다 controller에 넣어준다.
  final _eventController =
      StreamController<AddEditNoteUiEvent>.broadcast(); // 재구독 가능하게 만듬
  Stream<AddEditNoteUiEvent> get eventStream => _eventController.stream;

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
    if (title.isEmpty || content.isEmpty) {}

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

    _eventController.add(
      const AddEditNoteUiEvent.saveNote(),
    );
  }
}
