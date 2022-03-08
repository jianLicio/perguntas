import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './questao.dart';
import './resposta.dart';

main() {
  runApp(const PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['VERMELHO', 'VERDE', 'AZUL', 'PRETO'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['CACHORRO', 'GATO', 'CAVALO', 'VACA'],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': ['JOÃO', 'MARIA', 'PAULO', 'LETICIA'],
    }
  ];

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
      // print(_perguntaSelecionada);
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // print(_perguntas.length);

    // List<Widget>? respostas = [];

    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            color: const Color.fromARGB(0, 255, 5, 234),
            child: const Text('Perguntas'),
          ),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  Questao(
                      texto:
                          _perguntas[_perguntaSelecionada]['texto'].toString()),
                  ...respostas
                      .map((t) => Resposta(
                          texto: t.toString(), quandoSelecionado: _responder))
                      .toList(),
                ],
              )
            : Center(
                child: Text(
                  'PARABÉNS!',
                  style: GoogleFonts.pacifico(
                    fontSize: 38,
                    color: const Color.fromARGB(255, 37, 106, 158),
                  ),
                ),
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
