import 'package:clean_note/domain/model/note.dart';
import 'package:clean_note/presentation/notes/components/note_item.dart';
import 'package:clean_note/ui/colors.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final List<int> _items = List<int>.generate(50, (int index) => index);
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
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ReorderableListView.builder(
          onReorder: (int oldIndex, int newIndex) {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }

            final item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          },
          itemBuilder: (context, index) {
            return renderNoteItem(index: index);
          },
          itemCount: 2,
        ),
      ),
    );
  }

  NoteItem renderNoteItem({required int index}) {
    return NoteItem(
      key: Key(index.toString()),
      onDeleteTap: () {},
      note: Note(
        title: 'title ${_items[index]}',
        content: 'content ${_items[index]}',
        color: _items[index].isEven ? wisteria.value : skyBlue.value,
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }
}

List<NoteItem> noteItems() {
  return [
    NoteItem(
      onDeleteTap: () {},
      note: Note(
        title: 'title 1',
        content: 'content 1',
        color: wisteria.value,
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ),
    ),
    NoteItem(
      onDeleteTap: () {},
      note: Note(
        title: 'title 2',
        content: 'content 2',
        color: skyBlue.value,
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ),
    ),
  ];
}
