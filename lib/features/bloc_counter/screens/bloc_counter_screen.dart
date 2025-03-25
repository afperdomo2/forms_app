import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/features/bloc_counter/blocs/bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void _incrementCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncremented(value));
  }

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterBloc>().state;
    final counterBloc = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Counter Screen: ${counterState.transactionCount} '),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => counterBloc.add(CounterReset()),
          ),
        ],
      ),

      /// Body
      body: Center(
        // Utilizando context para leer el estado del Bloc
        child: context.select(
          (CounterBloc bloc) => Text('Bloc Counter: ${bloc.state.counter}'),
        ),
      ),

      /// FloatingActionButton
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          /// +3
          FloatingActionButton(
            heroTag: 'btn-1',
            child: const Text('+3'),
            onPressed: () => _incrementCounterBy(context, 3), // Usa el método
          ),
          const SizedBox(height: 8),

          /// +2
          FloatingActionButton(
            heroTag: 'btn-2',
            child: const Text('+2'),
            onPressed: () => counterBloc.add(const CounterIncremented(2)), // Usa el evento
          ),
          const SizedBox(height: 8),

          /// +1
          FloatingActionButton(
            heroTag: 'btn-3',
            child: const Text('+1'),
            onPressed: () => counterBloc.increaseBy(), // Usa el método del Bloc
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
