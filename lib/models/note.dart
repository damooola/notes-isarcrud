import 'package:isar/isar.dart';

// line to generate file and then run dart run build runner build
part 'note.g.dart';

@Collection()
class Note {
  Id id = Isar.autoIncrement;

  // text will be given later
  late String text;
}
