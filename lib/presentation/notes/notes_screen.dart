import 'package:clean_note/domain/model/note.dart';
import 'package:clean_note/presentation/notes/components/note_item.dart';
import 'package:clean_note/ui/colors.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Your Note',
          style: TextStyle(
            fontSize: 26,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          NoteItem(
            note: Note(
              title: 'title',
              content: 'content',
              color: wisteria.value,
              timestamp: DateTime.now().millisecondsSinceEpoch,
            ),
          ),
          NoteItem(
            note: Note(
              title: 'title',
              content: 'content',
              color: skyBlue.value,
              timestamp: DateTime.now().millisecondsSinceEpoch,
            ),
          ),
        ],
      ),
    );
  }
}
