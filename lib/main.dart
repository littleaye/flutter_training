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
        authDomain: "authentication-9c2f7.firebaseapp.com",
        projectId: "authentication-9c2f7",
        storageBucket: "authentication-9c2f7.appspot.com",
        messagingSenderId: "643072333337",
        appId: "1:643072333337:web:b67878cc33f99039aefc88",
        measurementId: "G-NEZ1KRD6MS"),
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(FirebaseUserRepo()));
}
