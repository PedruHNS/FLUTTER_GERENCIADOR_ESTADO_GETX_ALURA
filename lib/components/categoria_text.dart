import 'package:flutter/material.dart';

class CategoriaText extends StatelessWidget {
  const CategoriaText({super.key, required this.titulo});
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        titulo,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
    );
  }
}
