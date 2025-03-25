import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar usuario'),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const FlutterLogo(size: 100),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      hintText: 'Ingrese su nombre',
                    ),
                  ),
                  const TextField(
                    decoration:
                        InputDecoration(labelText: 'Apellido', hintText: 'Ingrese su apellido'),
                  ),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Correo', hintText: 'Ingrese su correo'),
                  ),
                  const TextField(
                    decoration:
                        InputDecoration(labelText: 'Contraseña', hintText: 'Ingrese su contraseña'),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        labelText: 'Confirmar contraseña', hintText: 'Confirme su contraseña'),
                  ),
                  const SizedBox(height: 10),
                  FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.person_add),
                    label: const Text('Registrar usuario'),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )),
      ),
    );
  }
}
