import 'package:flutter/material.dart';
import 'package:forms_app/shared/validators/form_validators.dart';

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
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            prefixIcon: Icons.person_outline,
            validator: FormValidators.isRequired,
          ),
          const SizedBox(height: 10),

          const RectangleTextFormField(
            label: 'Apellido',
            hint: 'Ingrese su apellido',
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            prefixIcon: Icons.person_outline,
            validator: FormValidators.isRequired,
          ),
          const SizedBox(height: 10),

          /// Correo
          const RectangleTextFormField(
            label: 'Correo',
            hint: 'Ingrese su correo',
            textInputAction: TextInputAction.next,
            prefixIcon: Icons.email_outlined,
            validator: FormValidators.isValidEmail,
          ),
          const SizedBox(height: 10),

          /// Contraseña
          RectangleTextFormField(
            label: 'Contraseña',
            hint: 'Ingrese su contraseña',
            textInputAction: TextInputAction.next,
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

class RectangleFilledButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final int flex;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const RectangleFilledButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.flex = 1,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: FilledButton.icon(
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(text),
      ),
    );
  }
}

class RectangleTextFormField extends StatelessWidget {
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
  final bool obscureText;
  final TextEditingController? controller; // Añadimos controller

  const RectangleTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.isRequired = true,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.autofocus = false,
    this.autocorrect = true,
    this.onChanged,
    this.validator,
    this.isDense = true,
    this.prefixIcon,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return TextFormField(
      controller: controller, // Agregamos el controller
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

      obscureText: obscureText,
      validator: validator,
      textInputAction: textInputAction,
      autofocus: autofocus,
      autocorrect: autocorrect,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
    );
  }
}
