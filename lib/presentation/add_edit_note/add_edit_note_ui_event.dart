import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_edit_note_ui_event.freezed.dart';

@freezed
abstract class AddEditNoteUiEvent<T> with _$AddEditNoteUiEvent {
  const factory AddEditNoteUiEvent.success(T data) = SaveNote;
}
