part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter = 0,
    this.transactionCount = 0,
  });

  copyWith({
    int? counter,
    int? transactionCount,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      transactionCount: transactionCount ?? this.transactionCount,
    );
  }

  /// Sobreescribimos el método para comparar objetos de tipo CounterState
  /// y saber si son iguales o no
  @override
  List<Object> get props => [counter, transactionCount];
}
