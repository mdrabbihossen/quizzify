import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizzify/models/que_model.dart';
import 'package:quizzify/services/api_services.dart';

class QuizController extends ChangeNotifier {
  QuestionModel questionModel = QuestionModel();
  bool loading = false;
  int _seconds = 60;
  int _currentQueIndex = 0;

  // option color
  final List<Color> _optionColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  late final Timer? _timer;

  int get seconds => _seconds;

  List<Color> get optionColor => _optionColor;

  int get currentQueIndex => _currentQueIndex;

  Timer get timer => _timer!;

// start timer
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        _seconds--;
        notifyListeners();
      } else {
        _timer!.cancel();
      }
    });
  }

// start timer end

// reset colors
  void resetColor() {
    _optionColor[0] = Colors.white;
    _optionColor[1] = Colors.white;
    _optionColor[2] = Colors.white;
    _optionColor[3] = Colors.white;
    _optionColor[4] = Colors.white;
    notifyListeners();
  }

  // next question
  void nextQuestion() {
    if (_currentQueIndex < questionModel.results!.length - 1) {
      _currentQueIndex++;
      resetColor();
      notifyListeners();
    }
  }

  Future getQuestions() async {
    loading = true;
    questionModel = await ApiServices().getQuestions();
    loading = false;
    notifyListeners();
  }
}
