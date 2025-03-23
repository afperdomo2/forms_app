import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de estado simple'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => context.push('/cubit-counter'),
          ),
          ListTile(
            title: const Text('BLoC'),
            subtitle: const Text('BLoC (Business Logic Component)'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => context.push('/bloc-counter'),
          ),
        ],
      ),
    );
  }
}
