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

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Counter: ${counterState.transactionCount}'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
        ],
      ),

      /// Body
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: Solo se ejecuta cuando el estado actual es diferente al anterior (optimización)
          // buildWhen: (previous, current) => previous.counter != current.counter,
          builder: (context, state) => Text('Cubit Counter ${state.counter}'),
        ),
      ),

      /// FloatingActionButton
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(heroTag: 'btn-1', child: const Text('+3'), onPressed: () {}),
          const SizedBox(height: 8),
          FloatingActionButton(heroTag: 'btn-2', child: const Text('+2'), onPressed: () {}),
          const SizedBox(height: 8),
          FloatingActionButton(heroTag: 'btn-3', child: const Text('+1'), onPressed: () {}),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
