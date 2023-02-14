import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';

class Answer extends StatelessWidget {
  const Answer(this.selectHandler, this.answerText, {super.key});

  final VoidCallback selectHandler;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - (2 * 24),
      height: 50,
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(
          answerText,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
