import 'package:flutter/material.dart';

import 'login_button.dart';
import 'password_field.dart';
import 'username_field.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

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
