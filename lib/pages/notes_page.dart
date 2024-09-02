import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isarcrud/components/drawer.dart';
import 'package:isarcrud/components/note_tile.dart';
import 'package:isarcrud/models/note.dart';
import 'package:isarcrud/models/note_database.dart';
import 'package:isarcrud/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import '../models/note_database.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final textController = TextEditingController();

  @override
  void initState() {
    // on app startup fetch existing notes
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
        actions: [
          TextButton(
              onPressed: () {
                textController.clear();

                Navigator.pop(context);
              },
              child: Text("Cancel",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ))),
          //create button
          TextButton(
              onPressed: () {
                context.read<NoteDatabase>().addNote(textController.text);
                textController.clear();

                Navigator.pop(context);
              },
              child: Text("Create",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ))),
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
        //actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          //cancel button
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ))),
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
              child: Text("Update",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ))),
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
    List<Note> currentNotes = noteDatabase.currentNotes;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 5,
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        onPressed:
            createNote, //Use direct function references (without () =>) when the function doesn’t require any additional parameters.
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "Notes",
              style: GoogleFonts.dmSerifText(
                  fontSize: 48,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          Expanded(
            //Expanded must be a child of a row/column
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
                // each note
                final note = currentNotes[index];
                return NoteTile(
                    text: note.text,
                    onEdit: () {
                      Navigator.pop(context);
                      updateNote(note);
                    }, //Use () => when passing functions that need specific arguments.
                    onDelete: () {
                      Navigator.pop(context);
                      deleteNote(note.id);
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
