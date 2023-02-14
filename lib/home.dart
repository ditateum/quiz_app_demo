// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'dart:math';

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
  var userindexAnswer = -1;

  _showMessage(String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  _alertMessage(String message) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Attention'),
        actions: [
          TextButton(
            child: Text('Quiz Done'),
            onPressed: () {
              Navigator.pop(context, "Ok");
              setState(() {
                questionIndex = 0;
              });
            },
          )
        ],
        content: Text(
          message,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  _answerQuestion(bool userAnswer) {
    //! Ambil list data
    var listAnswers = questions[questionIndex]['answers'] as List;
    //! Ambil Data benar atau salah
    var valueAnswer = listAnswers.map((value) => value['isCorrect']).toList();
    //TODO TANTANGAN || : KALAU SOAL HABIS => DONE

    if (questionIndex >= questions.length - 1) {
      _alertMessage("Soal Habis");
    } else {
      setState(() {
        // //!Milih Jawaban
        // userindexAnswer = userindexAnswer + 1;
        //! Soal Selanjutnya
        questionIndex = questionIndex + 1;
      });
    }
    //TODO TANTANGAN III : KALAU SOAL BENAR / SALAH
    for (bool keyAnswer in valueAnswer) {
      if (keyAnswer = userAnswer) {
        _showMessage('BENAR');
        break;
      } else {
        _showMessage('SALAH');
        break;
      }
    }
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
            return Center(
              child: Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Answer(() => _answerQuestion(answer['isCorrect']),
                      answer['text'].toString())),
            );
          }).toList(),
        ],
      ),
    );
  }
}
