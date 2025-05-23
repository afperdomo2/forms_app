import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:forms_app/features/register/cubits/cubit/register_cubit.dart';
import 'package:forms_app/shared/widgets/buttons/rectangle_filled_button.dart';
import 'package:forms_app/shared/widgets/inputs/rectangle_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Registrar usuario'),
        ),

        /// Body
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterLogo(size: 80),
                  SizedBox(height: 10),
                  _RegisterForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => __RegisterFormState();
}

class __RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final registerState = context.watch<RegisterCubit>().state;
    final registerCubit = context.read<RegisterCubit>();

    ValidationBuilder.setLocale('es');

    return Form(
      key: _formKey,
      child: Column(
        children: [
          /// Nombre
          RectangleTextFormField(
            label: 'Usuario',
            hint: 'Ingrese su nombre de usuario',
            prefixIcon: Icons.person_outline,
            textCapitalization: TextCapitalization.words, // Capitalizar palabras
            validator: ValidationBuilder().minLength(3).maxLength(20).build(),
            onChanged: (value) => registerCubit.setUsername(value),
          ),
          const SizedBox(height: 10),

          /// Correo
          RectangleTextFormField(
            label: 'Correo',
            hint: 'Ingrese su correo',
            prefixIcon: Icons.email_outlined,
            validator: ValidationBuilder().email().minLength(5).maxLength(50).build(),
            onChanged: (value) => registerCubit.setEmail(value),
          ),
          const SizedBox(height: 10),

          /// Contraseña
          RectangleTextFormField(
            label: 'Contraseña',
            hint: 'Ingrese su contraseña',
            prefixIcon: Icons.lock_outline,
            obscureText: true,
            validator: ValidationBuilder().minLength(6).build(),
            onChanged: (value) => registerCubit.setPassword(value),
          ),
          const SizedBox(height: 10),

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
                onPressed: () => _formKey.currentState?.reset(),
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
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario registrado')),
      );
      context.read<RegisterCubit>().onSubmit();
    }
  }
}
