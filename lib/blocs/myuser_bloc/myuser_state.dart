part of 'myuser_bloc.dart';

sealed class MyuserState extends Equatable {
  const MyuserState();
  
  @override
  List<Object> get props => [];
}

final class MyuserInitial extends MyuserState {}
