import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/bloc/form_submission_status.dart';
import 'package:flutter_training/bloc/login/login_bloc.dart';
import '../../repositories/login/login_repository.dart';
import 'widgets/signin_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocProvider(
        create: (context) =>
            LoginBloc(authRepo: context.read<LoginRepository>()),
        child: BlocListener<LoginBloc, LoginState>(
          listenWhen: (previous, current) =>
              previous.formStatus != current.formStatus,
          listener: (context, state) {
            final formStatus = state.formStatus;

            if (formStatus is SubmissionFailed) {
              _showSnackBar(context, formStatus.exception.toString());
            }
          },
          child: SingleChildScrollView(
            child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, -2),
                  child: Container(
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.tertiary),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-2.7, -4),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(2.7, -4),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.6,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Container()
                      ),
                    const SignInForm()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}