import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzify/views/home/screens/home_screen.dart';

import 'controller/quiz_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizController(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
