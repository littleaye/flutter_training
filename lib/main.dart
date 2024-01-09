import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/pizza_bloc.dart';
import 'models/pizza_model.dart';

void main() {
  runApp(const MyApp());
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
          home: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        title: const Text('The Pizza Bloc'),
      ),
      body: Center(child: BlocBuilder<PizzaBloc, PizzaState>(
        builder: (context, state) {
          if (state is PizzaInitial) {
            return const CircularProgressIndicator(
              color: Colors.orange,
            );
          }
          if (state is PizzaLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${state.pizzas.length}',
                  style: const TextStyle(
                      fontSize: 60, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      for (int index = 0; index < state.pizzas.length; index++)
                        Positioned(
                            left: Random().nextInt(250).toDouble(),
                            right: Random().nextInt(400).toDouble(),
                            top: Random().nextInt(250).toDouble(),
                            bottom: Random().nextInt(250).toDouble(),
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: state.pizzas[index].image,
                            ))
                    ],
                  ),
                )
              ],
            );
          } else {
            return const Text('Somthing went wrong!');
          }
        },
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              backgroundColor: Colors.orange[800],
              onPressed: () {
                context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[0]));
              },
              child: const Icon(Icons.local_pizza_outlined)),
          const SizedBox(height: 10),
          FloatingActionButton(
              backgroundColor: Colors.orange[800],
              onPressed: () {
                context.read<PizzaBloc>().add(RemovedPizza(Pizza.pizzas[0]));
              },
              child: const Icon(Icons.remove)),
          const SizedBox(height: 10),
          FloatingActionButton(
              backgroundColor: Colors.orange[800],
              onPressed: () {
                context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[1]));
              },
              child: const Icon(Icons.local_pizza)),
          const SizedBox(height: 10),
          FloatingActionButton(
              backgroundColor: Colors.orange[800],
              onPressed: () {
                context.read<PizzaBloc>().add(RemovedPizza(Pizza.pizzas[1]));
              },
              child: const Icon(Icons.remove)),
        ],
      ),
    );
  }
}
