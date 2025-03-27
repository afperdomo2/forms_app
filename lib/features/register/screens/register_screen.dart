import 'package:flutter/material.dart';
import 'package:forms_app/shared/validators/form_validators.dart';
import 'package:forms_app/shared/widgets/buttons/rectangle_filled_button.dart';
import 'package:forms_app/shared/widgets/inputs/rectangle_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar usuario'),
      ),

      /// Body
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const FlutterLogo(size: 80),
                const SizedBox(height: 10),
                _RegisterForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  _RegisterForm();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          /// Nombre
          const RectangleTextFormField(
            label: 'Nombre',
            hint: 'Ingrese su nombre',
            prefixIcon: Icons.person_outline,
            textCapitalization: TextCapitalization.words, // Capitalizar palabras
            validator: FormValidators.isRequired,
          ),
          const SizedBox(height: 10),

          const RectangleTextFormField(
            label: 'Apellido',
            hint: 'Ingrese su apellido',
            prefixIcon: Icons.person_outline,
            textCapitalization: TextCapitalization.words, // Capitalizar palabras
            validator: FormValidators.isRequired,
          ),
          const SizedBox(height: 10),

          /// Correo
          const RectangleTextFormField(
            label: 'Correo',
            hint: 'Ingrese su correo',
            prefixIcon: Icons.email_outlined,
            validator: FormValidators.isValidEmail,
          ),
          const SizedBox(height: 10),

          /// Contraseña
          RectangleTextFormField(
            label: 'Contraseña',
            hint: 'Ingrese su contraseña',
            prefixIcon: Icons.lock_outline,
            obscureText: true,
            controller: passwordController,
            validator: FormValidators.isValidPassword,
          ),
          const SizedBox(height: 10),

          /// Confirmar contraseña
          RectangleTextFormField(
            label: 'Confirmar contraseña',
            hint: 'Confirme su contraseña',
            prefixIcon: Icons.lock_outline,
            textInputAction: TextInputAction.done, // Cambiamos a done
            obscureText: true,
            validator: (value) => FormValidators.confirmPassword(value, passwordController.text),
          ),
          const SizedBox(height: 20),

          // Buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RectangleFilledButton(
                icon: Icons.save,
                text: 'Registrar',
                flex: 60,
                onPressed: () => _onSubmit(context),
              ),
              const SizedBox(width: 10),
              RectangleFilledButton(
                icon: Icons.cleaning_services_outlined,
                text: 'Limpiar',
                flex: 40,
                onPressed: () => formKey.currentState?.reset(),
                backgroundColor: Colors.grey.shade200,
                foregroundColor: Colors.black87,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _onSubmit(BuildContext context) {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario registrado')),
      );
    }
  }
}
