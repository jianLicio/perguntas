import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  Questao({Key? key, required this.texto}) : super(key: key);

  String texto;

  // Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        texto,
        style: const TextStyle(fontSize: 25),
        textAlign: TextAlign.center,
      ),
    );
  }
}
