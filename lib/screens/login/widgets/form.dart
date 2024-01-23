import 'package:flutter/cupertino.dart';

import 'login_button.dart';
import 'password_field.dart';
import 'username_field.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const UsernameField(),
          const PasswordField(),
          const SizedBox(height: 15),
          LoginButton(formKey: _formKey),
        ],
      ),
    );
  }
}
