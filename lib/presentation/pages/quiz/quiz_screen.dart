import 'package:flutter/material.dart';
import 'package:my_first_getx_app/presentation/pages/quiz/widget/question_widget.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: context.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                Color.fromARGB(255, 43, 0, 64),
                Color.fromARGB(255, 89, 0, 243)
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                  width: context.isDesktop
                      ? context.width / 2
                      : context.width - 40,
                  child: const QuestionWidget()),
            ],
          )),
    );
  }
}
