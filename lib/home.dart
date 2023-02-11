import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

import 'answer.dart';
import 'main.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

//TODO TANTANGAN IV : BUAT WIDGET SENDIRI => DONE
class _HomeState extends State<Home> {
  //TODO TANTANGAN I : SESUAIKAN UI PUNYA KAMU DAN DATANYA => DONE
  var questionIndex = 0;

  _showMessage(String message) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Attention'),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  questionIndex = 0;
                });
              },
              child: Text('Back to Quiz'))
        ],
        content: Text(
          message,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  void _answerQuestion() {
    //TODO TANTANGAN || : KALAU SOAL HABIS => DONE

    if (questionIndex >= questions.length - 1) {
      _showMessage("Soal Habis");
    } else {
      setState(() {
        questionIndex = questionIndex + 1;
      });
    }
    //TODO TANTANGAN III : KALAU SOAL BENAR / SALAH
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(content: Text('JAWABAN SALAH')),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff16213E),
        title: const Text('Quiz App'),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child:
                Question(questions[questionIndex]['questionText'].toString()),
          ),
          SizedBox(height: 30),
          Image.asset(questions[questionIndex]['image'].toString(), width: 200),
          SizedBox(height: 30),
          ...(questions[questionIndex]['answers'] as List).map((answer) {
            return Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Answer(_answerQuestion, answer));
          }).toList(),
        ],
      ),
    );
  }
}
