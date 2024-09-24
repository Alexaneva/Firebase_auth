import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(Colors.yellow),
      ),
      onPressed: onPressed,
      child: Text(label, style:  TextStyle(color: Colors.teal.shade900),),
    );
  }
}
