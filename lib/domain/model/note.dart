import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';
part 'note.g.dart';

// 불변 객체(수정X), toJson, fromJson, copyWith 제공
@freezed
class Note with _$Note {
  factory Note({
    required String title,
    required String content,
    required int color,
    required int timestamp,
    // 메모를 추가할 떄는 id를 모르니 nullable
    int? id,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}
