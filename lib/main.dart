import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA-mKukUySWeEPN_zAhnVLr1rBOKbfRI1s",
      appId: "",
      messagingSenderId: "643072333337",
      projectId: "authentication-9c2f7",
    ),
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(FirebaseUserRepo()));
}
