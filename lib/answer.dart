import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';

class Answer extends StatelessWidget {
  const Answer(this.selectHandler, this.answerText, this.color, {super.key});

  final GestureTapCallback selectHandler;
  final String answerText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          fixedSize: Size(MediaQuery.of(context).size.width - (2 * 24), 50)),
      onPressed: selectHandler,
      child: Text(
        answerText,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
