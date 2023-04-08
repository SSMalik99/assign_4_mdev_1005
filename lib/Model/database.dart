

import 'package:hive/hive.dart';

// notes datbase box
class NotesDatabase {

  List notes = [];

// notex box open from the hive datbase
  final notesBox = Hive.box("notesBox");

  void createInitialData () {
    notes = [
      "Create your notes"
    ];
  }

  /// load data from the local database
  void loadDatabase () {
    notes = notesBox.get("NOTESLIST");
  }

/// update data from the database
  void updateDatabase() {
    notesBox.put("NOTESLIST", notes);
  }



}