import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String note;
  final int id;
  final Function(int) onPressed;
  const NoteTile({super.key, required this.id, required this.note, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.lightBlueAccent)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  child: Text(note),
              ),
              ElevatedButton(onPressed:() {
                onPressed(id);
              }, child: const Text("Delete")
              )
            ],
          )

        ],
      ),
    );
  }
}
