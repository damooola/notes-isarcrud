import 'package:flutter/material.dart';
import 'package:isarcrud/models/note_database.dart';
import 'package:isarcrud/pages/notes_page.dart';
import 'package:provider/provider.dart';

// initialize note database

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize(); 
  runApp(
    ChangeNotifierProvider( 
        create: (context) => NoteDatabase(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: NotesPage());
  }
}
