import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  const Resultado({
    Key? key,
    required this.pontuacao,
    required this.reiniciarQuestionario,
  }) : super(key: key);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'PARABÉNS';
    } else if (pontuacao < 12) {
      return 'VOCÊ É BOM!';
    } else if (pontuacao < 16) {
      return 'IMPRESSIONANTE!';
    } else {
      return 'JEDI!!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: GoogleFonts.pacifico(
              fontSize: 38,
              color: const Color.fromARGB(255, 37, 106, 158),
            ),
          ),
        ),
        TextButton(
          child: Text(
            'Reiniciar',
            style: GoogleFonts.pacifico(
              fontSize: 35,
              color: const Color.fromARGB(255, 3, 47, 80),
            ),
          ),
          style: TextButton.styleFrom(
            primary: const Color.fromARGB(255, 47, 124, 196),
          ),
          onPressed: reiniciarQuestionario,
        )
      ],
    );
  }
}
