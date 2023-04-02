import 'package:assig_4_mdev_1005/home.dart';
import 'package:assig_4_mdev_1005/news.dart';
import 'package:assig_4_mdev_1005/notes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

// App Router
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
            return const NewScreen();
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
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );


  }
}

