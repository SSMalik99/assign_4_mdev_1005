import 'package:flutter/material.dart';


// Create my custom button and access in the other files
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  // initiate my button 
  MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}
