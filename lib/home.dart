// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

import 'answer.dart';
import 'main.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  //TODO TANTANGAN I : SESUAIKAN UI PUNYA KAMU DAN DATANYA => DONE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff16213E),
          title: const Text('Quiz App'),
        ),
        body: Question());
  }
}
