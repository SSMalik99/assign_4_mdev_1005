import 'package:assig_4_mdev_1005/MyButton.dart';
import 'package:flutter/material.dart';

class CreateDialogue extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  CreateDialogue({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  }) ;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: Colors.deepOrangeAccent[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add New Note",

              ),
            ),

            //button save and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                const SizedBox(width: 8,),
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            )

          ],
        ),
      ),
    );
  }
}
