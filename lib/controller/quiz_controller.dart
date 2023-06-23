import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizzify/models/que_model.dart';
import 'package:quizzify/services/api_services.dart';

class QuizController extends ChangeNotifier {
  QuestionModel questionModel = QuestionModel();
  int _seconds = 60;
  final int _currentQueIndex = 0;
  bool loading = false;
  late final Timer? _timer;

  int get seconds => _seconds;

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

// get question data
  Future<void> getQuestions() async {
    loading = true;
    questionModel = await ApiServices().getQuestions();
    loading = false;
    notifyListeners();
  }
}
