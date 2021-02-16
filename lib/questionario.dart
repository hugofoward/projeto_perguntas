import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final Function(int) onResponder;

  Questionario(
      {@required this.onResponder,
      @required this.perguntaSelecionada,
      @required this.perguntas});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : null;

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto']),
        ...respostas.map((resp) {
          return Resposta(resp['text'], () => onResponder(resp['pontuacao']));
        }).toList(),
      ],
    );
  }
}
