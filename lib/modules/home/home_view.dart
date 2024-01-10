import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('The Home Page'),
      ),
      body: Center(
          child: FilledButton(
              style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Colors.deepPurple)),
              onPressed: () {
                context.go('/setting');
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Go to Setting Page'),
                  SizedBox(width: 5),
                  Icon(Icons.settings)
                ],
              ))),
    );
  }
}
