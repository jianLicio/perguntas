import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() {
  runApp(PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  void _responder() {
    setState(() {
      _perguntaSelecionada++;
      print(_perguntaSelecionada);
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['VERMELHO', 'VERDE', 'AZUL', 'PRETO'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'Respostas': ['CACHORRO', 'GATO', 'CAVALO', 'VACA'],
      },
      {
        'texto': 'Qual é o seu instrutor favorito?',
        'Respostas': ['JOÃO', 'MARIA', 'PAULO', 'LETICIA'],
      }
    ];
    print(perguntas.length);

    List<String>? respostas =
        perguntas[_perguntaSelecionada].cast()['resposta'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            color: const Color.fromARGB(0, 255, 5, 234),
            child: const Text('Perguntas'),
          ),
        ),
        body: Column(
          children: [
            Questao(texto: perguntas[_perguntaSelecionada]['texto'].toString()),
            // Resposta(texto: 'Resposta 1', quandoSelecionado: _responder),
            // Resposta(texto: 'Resposta 2', quandoSelecionado: _responder),
            // Resposta(texto: 'Resposta 3', quandoSelecionado: _responder),
            ...respostas!
                .map((t) => Resposta(texto: t, quandoSelecionado: _responder))
                .toList(),
          ],
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
