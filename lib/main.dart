import 'package:flutter/material.dart';
import 'package:perguntas/resultado.dart';
import 'questionario.dart';

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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            color: const Color.fromARGB(0, 255, 5, 234),
            child: const Text('Perguntas'),
          ),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : const Resultado(),
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
