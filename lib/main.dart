
import 'package:assig_4_mdev_1005/home.dart';
import 'package:assig_4_mdev_1005/news.dart';
import 'package:assig_4_mdev_1005/notes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';


/// Main function for the application
void main() async {
  /// open the local database by using hive
  await Hive.initFlutter();
  var box = await Hive.openBox("notesBox");

/// run the application
  runApp(const MyApp());
}

// App Router for our application
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'notes',
          builder: (BuildContext context, GoRouterState state) {
            return const MyCustomForm();
          },
        ),
        GoRoute(
          path: 'news',
          builder: (BuildContext context, GoRouterState state) {
            return const NewsState();
          },
        )
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'AM_SA',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );


  }
}

