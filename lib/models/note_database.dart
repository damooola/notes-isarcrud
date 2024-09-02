import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:isarcrud/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;
  // initialize the database
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  final List<Note> currentNotes = [];

  // create a new note and save to database
  Future<void> addNote(String textfromuser) async {

    // create a new Note object and set its text to textFromUser
    final newNote = Note()..text = textfromuser;

    // save to database
    await isar.writeTxn(() => isar.notes.put(newNote));
    fetchNotes();
  }

  // read the database
  Future<void> fetchNotes() async {
    //all the notes currently in the database
    // can i use final instead of  List<Note>?
    List<Note> allNotes = await isar.notes.where().findAll();

    currentNotes.clear();
// then add the notes in database to currentNotes
    currentNotes.addAll(allNotes);
    notifyListeners();
  }

  // update a note in the database
  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  // delete a note from databse
  Future<void> deleteNote(id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
