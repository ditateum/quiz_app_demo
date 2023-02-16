import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Description extends StatelessWidget {
  const Description(this.textDescription, this.pressedButton, {super.key});

  final VoidCallback pressedButton;
  final String textDescription;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            textDescription,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(height: 30),
        ElevatedButton(
            style: ElevatedButton.styleFrom(fixedSize: Size(300, 52)),
            onPressed: pressedButton,
            child: Text('Next Question')),
        SizedBox(height: 50),
      ],
    );
  }
}
