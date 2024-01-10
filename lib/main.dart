import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'modules/pizza/bloc/pizza_bloc.dart';

void main() {
  runApp(MaterialApp.router(
    routerConfig: router,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PizzaBloc()..add(LoadPizzaCounter()),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
        ));
  }
}

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
              onPressed: () {
                context.go('/pizza');
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Go to Pizza Counter'),
                  SizedBox(width: 5),
                  Icon(Icons.local_pizza)
                ],
              ))),
    );
  }
}
