import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

final questions = [
  {
    'questionText':
        'Method pada stateFul widget yang digunakan untuk mentrigger method build dijalankan ulang?',
    'answers': ['setState', 'initState', 'dispose', 'logging'],
    'image': 'assets/example1.png'
  },
  {
    'questionText': 'Method pada stateFul widget yang hanya dijalankan sekali?',
    'answers': ['dispose', 'logging', 'setState', 'initState'],
    'image': 'assets/example2.png'
  },
  {
    'questionText':
        'Method pada stateFul widget yang untuk menghancurkan object saat aplikasi tidak digunakan?',
    'answers': ['setState', 'logging', 'initState', 'dispose'],
    'image': 'assets/example3.png'
  }
];
