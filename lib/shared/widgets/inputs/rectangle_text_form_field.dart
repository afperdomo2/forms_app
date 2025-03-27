import 'package:flutter/material.dart';

class RectangleTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool isRequired; // NOTE: No está en uso por el momento (investigar)
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
    this.isRequired = true, // NOTE: No está en uso por el momento (investigar)
    this.textInputAction = TextInputAction.next, // Por defecto es next (siguiente campo)
    this.textCapitalization = TextCapitalization.none, // Por defecto no capitaliza
    this.autofocus = false,
    this.autocorrect = true, // Por defecto autocorrector activado
    this.onChanged,
    this.validator,
    this.isDense = true,
    this.prefixIcon,
    this.obscureText = false, // Por defecto no es un campo de contraseña
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
