import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'text': 'Preto', 'pontuacao': 10},
        {'text': 'Vermelho', 'pontuacao': 5},
        {'text': 'Verde', 'pontuacao': 3},
        {'text': 'Branco', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorita?',
      'respostas': [
        {'text': 'Coelho', 'pontuacao': 10},
        {'text': 'Cobra', 'pontuacao': 5},
        {'text': 'Elefante', 'pontuacao': 3},
        {'text': 'Leão', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é a seu instrutor favorito?',
      'respostas': [
        {'text': 'Maria', 'pontuacao': 10},
        {'text': 'João', 'pontuacao': 5},
        {'text': 'Leo', 'pontuacao': 3},
        {'text': 'Pedro', 'pontuacao': 1},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // for (String textoResposta in perguntas[_perguntaSelecionada]['respostas']) {
    //   widgets.add(Resposta(textoResposta, _responder));
    // }
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Perguntas')),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntas: _perguntas,
              onResponder: _responder,
              perguntaSelecionada: _perguntaSelecionada)
          : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
