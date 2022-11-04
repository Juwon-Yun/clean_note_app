import 'package:clean_note/domain/model/note.dart';
import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  final Note note;

  const NoteItem({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(note.color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(note.title),
          Text(note.content),
        ],
      ),
    );
  }
}
