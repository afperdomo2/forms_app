import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/features/cubit_couter/blocs/cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  // Esta es otra forma de incrementar el contador usando el contexto
  void _incrementCounter(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().incrementBy(value);
  }

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;
    final counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        // title: Text('Cubit Counter: ${counterState.transactionCount}'),
        title: context.select(
          (CounterCubit cubit) => Text('Cubit Counter: ${cubit.state.transactionCount}'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => counterCubit.reset(),
          ),
        ],
      ),

      /// Body
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: Solo se ejecuta cuando el estado actual es diferente al anterior (optimización)
          // buildWhen: (previous, current) => previous.counter != current.counter,
          builder: (context, state) {
            return Text('Cubit Counter: ${state.counter}');
          },
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
            onPressed: () => context.read<CounterCubit>().incrementBy(3), // Usando context.read
          ),
          const SizedBox(height: 8),

          /// +2
          FloatingActionButton(
            heroTag: 'btn-2',
            child: const Text('+2'),
            onPressed: () => counterCubit.incrementBy(2), // Usando counterCubit
          ),
          const SizedBox(height: 8),

          /// +1
          FloatingActionButton(
            heroTag: 'btn-3',
            child: const Text('+1'),
            onPressed: () => _incrementCounter(context), // Usando _incrementCounter
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
