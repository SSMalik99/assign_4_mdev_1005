import 'package:assig_4_mdev_1005/create_note.dart';
import 'package:assig_4_mdev_1005/note_tile.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;


// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => NoteScreen();
}




/// The Notes screen
class NoteScreen extends State<MyCustomForm> {
  /// Constructs a [NoteScreen]
  final _myController = TextEditingController();
  
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _myController.dispose();
    super.dispose();
  }
  List notes = [
    "ship", "clip", "Drip"
  ];

  Function(int) deleteNote = ( int index) {
    developer.log(index.toString());
    developer.log("Singh");
  };

  void saveNewNote() {
    notes.add(_myController.text);
    developer.log(notes.toString());
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
      appBar: AppBar(title: const Text('Home')),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewNote,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return NoteTile(id: index, note: notes[index], onPressed: deleteNote);
              }
          ),
      );
  }

}