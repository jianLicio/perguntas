import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  const Resposta(
      {Key? key, required this.texto, required this.quandoSelecionado})
      : super(key: key);
  final String texto;
  final void Function() quandoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 50,
      margin: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        border: Border(
            top:
                BorderSide(width: 10, color: Color.fromARGB(255, 218, 206, 44)),
            left: BorderSide(width: 10),
            right: BorderSide(width: 10),
            bottom: BorderSide(width: 10)),
      ),
      child: ElevatedButton(
        onPressed: quandoSelecionado,
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 62, 212, 67),
        ),
        child: Text(texto),
      ),
    );
  }
}
