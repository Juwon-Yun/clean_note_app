import 'package:clean_note/data/data_source/note_db_helper.dart';
import 'package:clean_note/data/repository/note_repository_impl.dart';
import 'package:clean_note/domain/repository/note_repository.dart';
import 'package:clean_note/domain/use_case/add_note.dart';
import 'package:clean_note/domain/use_case/delete_note.dart';
import 'package:clean_note/domain/use_case/get_notes.dart';
import 'package:clean_note/domain/use_case/update_note.dart';
import 'package:clean_note/domain/use_case/use_cases.dart';
import 'package:clean_note/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:clean_note/presentation/notes/note_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';

Future<List<SingleChildWidget>> getProviders() async {
  Database database = await openDatabase(
    'notes_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)');
    },
  );

  NoteDbHelper noteDbHelper = NoteDbHelper(database);
  NoteRepository noteRepository = NoteRepositoryImpl(noteDbHelper);
  UseCases useCases = UseCases(
    addNote: AddNote(noteRepository),
    deleteNote: DeleteNote(noteRepository),
    getNotes: GetNotes(noteRepository),
    updateNote: UpdateNote(noteRepository),
  );
  NotesViewModel notesViewModel = NotesViewModel(useCases);
  AddEditNoteViewModel addEditNoteViewModel =
      AddEditNoteViewModel(noteRepository);

  return [
    ChangeNotifierProvider(
      create: (_) => notesViewModel,
    ),
    ChangeNotifierProvider(
      create: (_) => addEditNoteViewModel,
    ),
  ];
}
