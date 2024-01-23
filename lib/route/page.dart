
import 'package:flutter_training/main.dart';
import 'package:flutter_training/screens/home/home_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const MyApp(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomepageScreen(),
  ),
]);
