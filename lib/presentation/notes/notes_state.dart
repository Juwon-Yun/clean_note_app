import 'package:clean_note/domain/model/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_state.freezed.dart';

part 'notes_state.g.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState({
    // 기본값 정의
    // @Default([])  List<Note> notes,
    required List<Note> notes,
  }) = _NotesState;

  factory NotesState.fromJson(Map<String, dynamic> json) =>
      _$NotesStateFromJson(json);
}
