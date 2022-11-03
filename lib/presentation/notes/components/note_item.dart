import 'package:clean_note/domain/model/note.dart';
import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  final Note note;

  const NoteItem({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(note.color),
      ),
      child: Column(
        children: [
          Text(note.title),
          Text(note.content),
        ],
      ),
    );
  }
}
