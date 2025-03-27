import 'package:flutter/material.dart';

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
