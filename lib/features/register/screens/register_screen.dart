import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey, // Asignamos la clave al formulario
      child: Column(
        children: [
          /// Nombre
          CustomTextFormField(
            label: 'Nombre',
            hint: 'Ingrese su nombre',
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            prefixIcon: Icons.person_outline,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo es requerido';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),

          CustomTextFormField(
            label: 'Apellido',
            hint: 'Ingrese su apellido',
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            prefixIcon: Icons.person_outline,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo es requerido';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),

          /// Correo
          CustomTextFormField(
            label: 'Correo',
            hint: 'Ingrese su correo',
            textInputAction: TextInputAction.next,
            prefixIcon: Icons.email_outlined,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo es requerido';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),

          /// Contraseña
          CustomTextFormField(
            label: 'Contraseña',
            hint: 'Ingrese su contraseña',
            textInputAction: TextInputAction.next,
            prefixIcon: Icons.lock_outline,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo es requerido';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),

          /// Confirmar contraseña
          CustomTextFormField(
            label: 'Confirmar contraseña',
            hint: 'Confirme su contraseña',
            prefixIcon: Icons.lock_outline,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo es requerido';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          // Buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 60,
                child: FilledButton.icon(
                  onPressed: () => _onSubmit(context),
                  icon: const Icon(Icons.person_add),
                  label: const Text('Registrar'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 40,
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    foregroundColor: Colors.black87,
                  ),
                  onPressed: () => formKey.currentState?.reset(),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Limpiar'),
                ),
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

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool isRequired;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final bool autofocus;
  final bool autocorrect;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isDense;
  final IconData? prefixIcon;
  final bool obscureText; // New parameter for password fields

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.isRequired = true,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.autofocus = false,
    this.autocorrect = true, // Sirve para corregir errores de escritura
    this.onChanged,
    this.validator,
    this.isDense = true,
    this.prefixIcon,
    this.obscureText = false, // Agrega el parámetro para campos de contraseña
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        isDense: isDense,

        /// border
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),

        /// enabledBorder
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.primary),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),

        /// focusedBorder
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.primary, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),

      obscureText: obscureText, // Add obscureText property
      validator: validator,
      textInputAction: textInputAction,
      autofocus: autofocus,
      autocorrect: autocorrect,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
    );
  }
}
