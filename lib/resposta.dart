import 'package:flutter/material.dart';

class _Resposta extends State<Resposta> {

  final String texto;
  final void Function() onSelecao;

  _Resposta(this.texto, this.onSelecao);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith<TextStyle?>((states) {
              if(states.contains(MaterialState.pressed)){
                return const TextStyle();
              }
              return const TextStyle(
                fontWeight: FontWeight.bold
              );
            }),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.deepOrange;
              }
              if (states.contains(MaterialState.disabled)) {
                return Colors.amberAccent;
              }
              return Colors.blueGrey;
            })),
        onPressed: onSelecao,
        child: Text(texto),
      ),
    );
  }
}

class Resposta extends StatefulWidget {
  late final String texto;
  late final void Function() onSelecao;

  Resposta(this.texto, this.onSelecao);

  @override
  _Resposta createState() {
    return _Resposta(texto, onSelecao);
  }
}
