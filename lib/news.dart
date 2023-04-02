
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';

/// The home screen
class NewScreen extends StatelessWidget {
  /// Constructs a [NewScreen]
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("This is News", style:TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,

            )),
            Text("Singh")
          ],
        ),
      ),
    );
  }
}