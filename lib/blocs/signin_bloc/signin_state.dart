part of 'signin_bloc.dart';

sealed class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object> get props => [];
}

final class SigninInitial extends SigninState {}

class SigninSuccess extends SigninState {}

class SigninFailure extends SigninState {
  final String? message;

  const SigninFailure({this.message});
}

class SigninProcess extends SigninState {}
