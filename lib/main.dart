import 'package:flutter/material.dart';
import 'package:primeiroapp/resultado.dart';
import './questao.dart';
import './resposta.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas =[
    {
      'texto': 'Qual é sua cor preferida?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco']
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão']
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': ['Maria', 'João', 'Léo', 'Pedro']
    }
  ];

  void _responder() {
    if (temPerguntaSelecionada){
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas'] as List<String>
        : [];
    List<Widget> widget =
        respostas.map((t) => Resposta(t, _responder)).toList();

    // for(String textoResp in perguntas [_perguntaSelecionada].cast()['respostas']){
    //   widgets.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada ? Column(
          children: [
            Questao(_perguntas[_perguntaSelecionada]['texto'] as String),
            ...widget,
          ],
        ) : Resultado()
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
