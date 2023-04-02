
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';

/// The home screen
class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SingleChildScrollView(
      child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Welcome To our Assignment 4", style:TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,

              )),

              const Text("MDEV 1005", style:TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,

              )),
              Container(
                padding: const EdgeInsets.all(3),
                color: Colors.blue[600],
                // transform: Matrix4.rotationZ(0.1),
                margin: const EdgeInsets.all(10),
                child: const Image(image: NetworkImage("https://www.linkpicture.com/q/SA_7.png")),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        child: const Image(image: AssetImage("assets/images/aman.jpg")),

                      ),
                      const Text("Amandeep Kaur")
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => context.go('/notes'),
                        child: const Text('Notes'),

                      ),

                      ElevatedButton(
                        onPressed: () => context.go('/news'),
                        child: const Text('News'),
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        child: const Image(image: AssetImage("assets/images/sarav.jpg")),
                      ),
                      const Text("Saravjeet Singh")
                    ],
                  )

                ],
              )

            ],
          ),
        ),
      )
    );
  }
}