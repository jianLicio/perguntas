import 'package:flutter/material.dart';
import 'package:perguntas/resultado.dart';
import 'questionario.dart';

main() {
  runApp(
    const MaterialApp(
      home: PerguntaApp(),
    ),
  );
}

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  String texto = 'texto';
  final _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        // {'texto': AppLocalizations.of(context)!.vermelho, 'pontuacao': 10},
        {'texto': 'VERDE', 'pontuacao': 5},
        {'texto': 'AZUL', 'pontuacao': 4},
        {'texto': 'PRETO', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'CACHORRO', 'pontuacao': 2},
        {'texto': 'GATO', 'pontuacao': 7},
        {'texto': 'CAVALO', 'pontuacao': 3},
        {'texto': 'VACA', 'pontuacao': 9},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'JOÃO', 'pontuacao': 8},
        {'texto': 'MARIA', 'pontuacao': 5},
        {'texto': 'PAULO', 'pontuacao': 1},
        {'texto': 'LETICIA', 'pontuacao': 6},
      ],
    }
  ];

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
    debugPrint(_pontuacaoTotal as String);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
            : Resultado(
                pontuacao: _pontuacaoTotal,
                reiniciarQuestionario: _reiniciarQuestionario,
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
