import 'package:flutter_training/modules/home/home_view.dart';
import 'package:flutter_training/modules/setting/setting_view.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/setting',
    builder: (context, state) => const SettingPage(),
  ),
]);
