import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterIncremented>(_onCounterIncreadsed);
    on<CounterReset>(_onCounterReset);
  }

  FutureOr<void> _onCounterIncreadsed(CounterIncremented event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: (state.counter + event.value).toInt(),
      transactionCount: state.transactionCount + 1,
    ));
  }

  FutureOr<void> _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
    emit(const CounterInitial());
  }
}
