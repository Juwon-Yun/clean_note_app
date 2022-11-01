import 'package:clean_note/presentation/notes/notes_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const NoteApp(),
  );
}

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NoteScreen(),
    );
  }
}
