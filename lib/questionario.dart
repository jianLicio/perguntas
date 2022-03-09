import 'package:flutter/cupertino.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function() responder;

  const Questionario({
    Key? key,
    required this.perguntas,
    required this.perguntaSelecionada,
    // required this.quandoResponder,
    required this.responder,
  }) : super(key: key);

  // bool get temPerguntaSelecionada {
  //   return perguntaSelecionada < perguntas.length;
  // }

  @override
  Widget build(BuildContext context) {
    // List<String> respostas = temPerguntaSelecionada
    //     ? perguntas[perguntaSelecionada].cast()['respostas']
    //     : [];
    List<String> respostas = perguntas[perguntaSelecionada].cast()['respostas'];

    return Column(children: <Widget>[
      Questao(texto: perguntas[perguntaSelecionada]['texto'].toString()),
      ...respostas
          .map((t) =>
              Resposta(texto: t.toString(), quandoSelecionado: responder))
          .toList(),
    ]);
  }
}
