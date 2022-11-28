import 'package:clean_note/di/provider_setup.dart';
import 'package:clean_note/presentation/notes/notes_screen.dart';
import 'package:clean_note/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // NoteApp이 만들어지기 전에 db를 먼저 만듬
  final providers = await getProviders();

  runApp(
    MultiProvider(
      providers: providers,
      child: const NoteApp(),
    ),
  );
}

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        unselectedWidgetColor: Colors.white,
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
            ),
        // textTheme: Theme.of(context).textTheme.apply(
        //       bodyColor: Colors.white,
        //     ),
        // apply 가 없음
        radioTheme: Theme.of(context).radioTheme.copyWith(
              fillColor: const MaterialStatePropertyAll(
                Colors.white,
              ),
            ),
      ),
      home: const NoteScreen(),
    );
  }
}
