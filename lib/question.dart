import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/description.dart';
import 'package:quiz_app/main.dart';

class Question extends StatefulWidget {
  const Question({
    super.key,
  });

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  var questionIndex = 0;
  var changeWidget = false;
  bool clicked = false;
  int selectedIndex = -1;

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
                changeWidget = false;
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

  _answerQuestion(
    bool userAnswer,
  ) {
    //! Ambil list data
    var listAnswers = questions[questionIndex]['answers'] as List;
    //! Ambil Data benar atau salah
    var valueAnswer = listAnswers.map((value) => value['isCorrect']).toList();
    //! Ambil data description
    //TODO: Ketika menjawab soal terjadi perubahan widget

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
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        selectedIndex = listAnswers.hashCode;
        changeWidget = !changeWidget;
      });
    });
  }

  //TODO TANTANGAN || : KALAU SOAL HABIS => DONE
  _nextQuestion() {
    if (questionIndex >= questions.length - 1) {
      _alertMessage("Soal Habis");
    } else {
      setState(() {
        questionIndex = questionIndex + 1;
        changeWidget = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var listAnswers = questions[questionIndex]['answers'] as List;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(questions[questionIndex]['questionText'].toString(),
                style: const TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center),
          ),
          SizedBox(height: 30),
          Center(
              child: Image.asset(questions[questionIndex]['image'].toString(),
                  width: 200)),
          SizedBox(height: 30),
          changeWidget == true
              ? Description(questions[questionIndex]['description'].toString(),
                  () => _nextQuestion())
              : Column(
                  children: listAnswers
                      .map((answer) => Center(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 16),
                              child: Answer(() {
                                _answerQuestion(answer['isCorrect']);
                                setState(() {
                                  selectedIndex = listAnswers.hashCode;
                                });
                              },
                                  answer['text'],
                                  selectedIndex == listAnswers.hashCode
                                      ? (answer['isCorrect']
                                          ? Colors.green
                                          : Colors.red)
                                      : Colors.black87),
                            ),
                          ))
                      .toList(),
                )
        ],
      ),
    );
  }
}
