import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isarcrud/components/drawer.dart';
import 'package:isarcrud/models/note.dart';
import 'package:isarcrud/models/note_database.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final textController = TextEditingController();

  @override
  void initState() {
    // on app startup fetch existimng notes
    readNote();
    super.initState();
  }

  //create a note
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add new note"),
        content: TextField(
          controller: textController,
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel")),
          //create button
          TextButton(
              onPressed: () {
                context.read<NoteDatabase>().addNote(textController.text);
                textController.clear();

                Navigator.pop(context);
              },
              child: const Text("Create")),
        ],
      ),
    );
  }

  //read note
  void readNote() {
    context.read<NoteDatabase>().fetchNotes();
  }

  //update note
  updateNote(Note note) {
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit note"),
        content: TextField(
          controller: textController,
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          //cancel button
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel")),
          //update button
          TextButton(
              onPressed: () {
                context
                    .read<NoteDatabase>()
                    .updateNote(note.id, textController.text);

                // clear controller
                textController.clear();

                Navigator.pop(context);
              },
              child: const Text("Update")),
        ],
      ),
    );
  }

  // delete note
  deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();

    //currrent notes
    List<Note> currentNotes = noteDatabase
        .currentNotes; // why not call context.watch<NoteDatabase>().curentNotes directly?
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          "Notes",
          style: GoogleFonts.dmSerifText(
              fontSize: 48,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
        elevation: 5,
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: currentNotes.length,
          itemBuilder: (context, index) {
            // each note
            final note = currentNotes[index];
            return ListTile(
              title: Text(note.text),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () => updateNote(note),
                      icon: const Icon(Icons.edit)),
                  IconButton(
                      onPressed: () => deleteNote(note.id),
                      icon: const Icon(Icons.delete))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
