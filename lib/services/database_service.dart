import 'package:hive/hive.dart';
import 'package:simple_note/models/note.dart';

class DatabaseService {
  final String boxName = 'notesBox';

  // Menambahkan Note
  Future<void> addNote(Note note) async {
    final box = await Hive.openBox(boxName);
    await box.add(note);
  }

  // Fetch All Notes
  Future<List<Note>> getAllNotes() async {
    final box = await Hive.openBox(boxName);
    return box.values.toList().cast<Note>();
  }

  // Update Note
  Future<void> updateNote(int key, Note note) async {
    final box = await Hive.openBox(boxName);
    await box.put(key, note);
  }

  // Delete Note
  Future<void> deleteNote(Note note) async {
    final box = await Hive.openBox(boxName);
    await box.delete(note.key);
  }
}
