import 'package:flutter/material.dart';

class BotaoGenerico extends StatefulWidget {
  late final String text;
  late final void Function() reload;

  BotaoGenerico(this.text, this.reload,{Key? key}) : super(key: key);

  @override
  State<BotaoGenerico> createState() => _BotaoGenericoState(text, reload);
}

class _BotaoGenericoState extends State<BotaoGenerico> {
  final String text;
  final void Function() reload;

  _BotaoGenericoState(this.text, this.reload);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
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
          }),
        ),
        onPressed: reload,
        child: Text(text),
      ),
    );
  }
}
