import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

//
class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

//TODO TANTANGAN IV : BUAT WIDGET SENDIRI
class _HomeState extends State<Home> {
  //TODO TANTANGAN I : SESUAIKAN UI PUNYA KAMU DAN DATANYA
  final questions = [
    {
      'questionText':
          'Method pada stateFul widget yang digunakan untuk mentrigger method build dijalankan ulang?',
      'answers': ['setState', 'initState', 'dispose', 'logging'],
    },
    {
      'questionText':
          'Method pada stateFul widget yang hanya dijalankan sekali?',
      'answers': ['dispose', 'logging', 'setState', 'initState'],
    },
    {
      'questionText':
          'Method pada stateFul widget yang untuk menghancurkan object saat aplikasi tidak digunakan?',
      'answers': ['setState', 'logging', 'initState', 'dispose'],
    }
  ];

  var questionIndex = 0;

  void _answerQuestion() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('JAWABAN SALAH')),
    );
    //TODO TANTANGAN || : KALAU SOAL HABIS

    //TODO TANTANGAN III : KALAU SOAL BENAR / SALAH
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Column(
        children: [
          Question(questions[questionIndex]['questionText'] as String),
          ...(questions[questionIndex]['answers'] as List).map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList(),
        ],
      ),
    );
  }
}
