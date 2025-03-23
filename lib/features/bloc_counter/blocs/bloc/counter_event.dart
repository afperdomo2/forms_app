part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

class IncrementCounter extends CounterEvent {
  final int value;

  const IncrementCounter(this.value);
}
