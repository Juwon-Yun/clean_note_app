import 'package:clean_note/presentation/notes/notes_screen.dart';
import 'package:clean_note/ui/colors.dart';
import 'package:flutter/material.dart';

void main() {
  // NoteApp이 만들어지기 전에 db를 먼저 만듬

  runApp(
    const NoteApp(),
  );
}

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.white,
          backgroundColor: darkGray,
          canvasColor: darkGray,
          floatingActionButtonTheme:
              Theme.of(context).floatingActionButtonTheme.copyWith(
                    backgroundColor: lightBlue,
                    foregroundColor: darkGray,
                  ),
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
                backgroundColor: darkGray,
              )),
      home: const NoteScreen(),
    );
  }
}
