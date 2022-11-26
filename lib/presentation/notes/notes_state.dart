import 'package:clean_note/domain/model/note.dart';
import 'package:clean_note/domain/util/note_order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_state.freezed.dart';

// part 'notes_state.g.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState({
    // 기본값 정의
    // @Default([])  List<Note> notes,
    required List<Note> notes,
    required NoteOrder noteOrder,
  }) = _NotesState;
  // freezed 안에 freezed 를 사용하려면
  // .g.dart, FromJson, toJson을 삭제해서
  // json 직렬화를 없앤다.

  // factory NotesState.fromJson(Map<String, dynamic> json) =>
  //     _$NotesStateFromJson(json);
}
