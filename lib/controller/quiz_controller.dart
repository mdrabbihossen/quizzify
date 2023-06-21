import 'dart:async';

import 'package:flutter/material.dart';

class QuizController extends ChangeNotifier {
  int _seconds = 60;
  late final Timer? _timer;

  int get seconds => _seconds;

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
// using startTimer

}
