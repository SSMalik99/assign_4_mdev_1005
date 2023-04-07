
import 'package:assig_4_mdev_1005/Model/database.dart';
import 'package:assig_4_mdev_1005/create_note.dart';
import 'package:assig_4_mdev_1005/note_tile.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:hive/hive.dart';






// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => NoteScreen();
}




/// The Notes screen
class NoteScreen extends State<MyCustomForm> {
  /// Constructs a [NoteScreen]
  ///
  final _myController = TextEditingController();

  NotesDatabase notesDb = NotesDatabase();
  final notesBox = Hive.box("notesBox");

  @override
  void initState() {

    if(notesBox.get("NOTESLIST") == null) {
      notesDb.createInitialData();
    }else {
      notesDb.loadDatabase();
    }
    super.initState();
  }
  
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _myController.dispose();
    super.dispose();
  }


  // List notes = [
  //   "ship", "clip", "Drip"
  // ];



  void deleteNote ( int index) {
    developer.log(index.toString());
    setState(() {
      notesDb.notes.removeAt(index);

    });
    notesDb.updateDatabase();
    developer.log("Singh");
  }

  void saveNewNote() {
    setState(() {
      notesDb.notes.add(_myController.text);
    });
    // notes.add(_myController.text);
    // developer.log(notesDb.toString());
    notesDb.updateDatabase();
    _myController.clear();
    Navigator.of(context).pop();


  }



  void createNewNote () {

    showDialog(context: context, builder: (context) {
      return CreateDialogue(
          controller: _myController,
          onSave: saveNewNote,
          onCancel: () => Navigator.of(context).pop(),
        );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Note')),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewNote,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
              itemCount: notesDb.notes.length,
              itemBuilder: (context, index) {
                return NoteTile(id: index, note: notesDb.notes[index], onPressed: deleteNote);
              }
          ),
      );
  }

}