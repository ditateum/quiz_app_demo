import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question(
    this.questionText, {
    super.key,
  });

  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10.0),
      child: Text(
        questionText,
        style: const TextStyle(
          fontSize: 28.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
