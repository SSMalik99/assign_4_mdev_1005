

import 'package:hive/hive.dart';

class NotesDatabase {

  List notes = [];

  final notesBox = Hive.box("notesBox");

  void createInitialData () {
    notes = [
      "Create your notes"
    ];
  }

  void loadDatabase () {
    notes = notesBox.get("NOTESLIST");
  }

  void updateDatabase() {
    notesBox.put("NOTESLIST", notes);
  }



}