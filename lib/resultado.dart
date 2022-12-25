import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  Resultado(this.pontuacao);

  String get fraseResultado{
    if(pontuacao < 8){
      return 'Parabens!!';
    }
    else if(pontuacao < 12){
      return 'Você é bom';
    }
    else if(pontuacao < 16){
      return 'Impressionante!!!';
    }
    else{
      return 'Nível Jedi!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          fraseResultado,
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
