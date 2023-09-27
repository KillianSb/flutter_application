import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'demo_mod8_connexion.dart';
import 'demo_mod8_page2.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final goRoute = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const FormWidget(),
      ),
      GoRoute(
        path: '/page2/:email',
        builder: (context, state) => SecondPage(
            state.pathParameters["email"] ?? ""
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
