import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('The Seeting Page'),
      ),
      body: Center(
          child: FilledButton(
              style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Colors.grey)),
              onPressed: () {
                context.go('/');
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Go to Home page'),
                  SizedBox(width: 5),
                  Icon(Icons.home)
                ],
              ))),
    );
  }
}
