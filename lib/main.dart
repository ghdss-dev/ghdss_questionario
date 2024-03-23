import 'package:flutter/material.dart';
import 'package:questionario_ghdss/questionario.dart';
import 'package:questionario_ghdss/resultado.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita ?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ],

    },

    {
      'texto': 'Qual é o seu animal favorito ?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao':10},
        {'texto': 'Cobra', 'pontuacao':5},
        {'texto': 'Elefante', 'pontuacao':3},
        {'texto': 'Leão', 'pontuacao':1}
      ],
    },

    {
      'texto': 'Qual é o seu instrutor favorito ?',
      'respostas': [
        {'texto': 'Gustavo', 'pontuacao': 10},
        {'texto': 'Henrique', 'pontuacao': 5},
        {'texto': 'Doni', 'pontuacao': 3},
        {'texto': 'Souza', 'pontuacao': 1}
      ],
    }

  ];

  void _responder(int pontuacao) {
    if(temPerguntaSelecionada) {
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

  bool get temPerguntaSelecionada{

    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada ? Questionario(perguntas: _perguntas,
        perguntaSelecionada: _perguntaSelecionada, quantoResponder: _responder,
        ) : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      )
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
