import 'package:flutter/cupertino.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final int? perguntaSelecionada;
  final List<Map<dynamic, dynamic>> perguntas;
  final void Function(int) responder;

  const Questionario({
    Key? key,
    required this.perguntas,
    this.perguntaSelecionada,
    required this.responder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> respostas =
        perguntas[perguntaSelecionada!].cast()['respostas'];

    return Column(children: <Widget>[
      Questao(texto: perguntas[perguntaSelecionada!]['texto'].toString()),
      ...respostas.map((respo) {
        return Resposta(
          texto: respo['texto'].toString(),
          quandoSelecionado: () =>
              responder(int.parse(respo['pontuacao'].toString())),
        );
      }).toList(),
    ]);
  }
}
