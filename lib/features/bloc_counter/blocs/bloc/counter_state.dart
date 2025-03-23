part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  const CounterState(this.counter, this.transactionCount);

  @override
  List<Object> get props => [counter, transactionCount];

  CounterState copyWith({
    int? counter,
    int? transactionCount,
  }) {
    return CounterState(
      counter ?? this.counter,
      transactionCount ?? this.transactionCount,
    );
  }
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(0, 0);
}
