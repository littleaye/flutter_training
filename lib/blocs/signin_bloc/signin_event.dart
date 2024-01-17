part of 'signin_bloc.dart';

sealed class SigninEvent extends Equatable {
  const SigninEvent();

  @override
  List<Object> get props => [];
}

class SigninRequired extends SigninEvent {
  final String email;
  final String password;

  const SigninRequired(this.email, this.password);
}

class SignoutRequired extends SigninEvent {
  const SignoutRequired();
}
