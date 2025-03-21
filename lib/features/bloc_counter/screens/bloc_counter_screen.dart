import 'package:flutter/material.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter Screen'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
        ],
      ),

      /// Body
      body: const Center(
        child: Text('Bloc Counter Screen'),
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
