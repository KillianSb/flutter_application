import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String email;
  const SecondPage(this.email, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Second Page'),
            Text("Bienvenue ${email}"),
          ],
        ),
      ),
    );
  }
}
