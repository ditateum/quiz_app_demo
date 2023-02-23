// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';

class QuestionModel {
  String? questionText;
  List<Answers>? answers;
  String? image;
  String? description;
  QuestionModel({
    this.questionText,
    this.answers,
    this.image,
    this.description,
  });

  QuestionModel.fromJson(Map<String, dynamic> json)
      : questionText = json['questionText'],
        answers = List<Answers>.from(
            json['answers'].map((answer) => Answers.fromJson(answer))),
        image = json['image'],
        description = json['description'];
}

//! list<Map>
class Answers {
  int? id;
  String? text;
  bool? isCorrect;
  Answers({
    this.id,
    this.text,
    this.isCorrect,
  });

  Answers.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        text = json['text'],
        isCorrect = json['isCorrect'];

  @override
  String toString() => 'Answers(id: $id, text: $text, isCorrect: $isCorrect)';
}
