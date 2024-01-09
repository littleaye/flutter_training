part of 'counter_bloc.dart';

class CounterStates {}

class InitialState extends CounterStates {}

class UpdateState extends CounterStates {
  final int counter;
  UpdateState(this.counter);
}
