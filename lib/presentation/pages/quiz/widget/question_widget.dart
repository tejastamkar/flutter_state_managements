import 'package:flutter/material.dart';
import 'package:my_first_getx_app/data/model/question_model.dart';
import 'package:my_first_getx_app/domain/use_cases/question_answer.dart';
import 'package:my_first_getx_app/presentation/pages/quiz/widget/answer_widget.dart';
import 'package:my_first_getx_app/presentation/pages/quiz/widget/question_section_widget.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    super.key,
  });
  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int selectedIndex = -1;
  QuestionAnswer questionAnswer = QuestionAnswer();

  void onPressSelectOption(index) {
    selectedIndex = selectedIndex == index ? -1 : index;
    setState(() {});
    Future.delayed(const Duration(milliseconds: 700), () {
      questionAnswer.onPressSelectOption(index);
      selectedIndex = -1;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    QuestionModel questionModel =
        questionAnswer.myQuestions.elementAt(questionAnswer.currentIndex);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: questionAnswer.showAnswerSheet
          ? SizedBox(
              height: context.height - 300,
              width: context.isDesktop ? context.width / 4 : context.width - 40,
              child: AnswerWidget(
                questionAnswer: questionAnswer,
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "The ${questionAnswer.currentIndex + 1} Question is ..",
                  style: TextStyle(
                      fontSize: context.isDesktop ? 16 : 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  questionModel.question,
                  style: TextStyle(
                      fontSize: context.isDesktop ? 20 : 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                QuestionSection(
                    onPressSelectOption: (index) => onPressSelectOption(index),
                    questionModel: questionModel,
                    selectedIndex: selectedIndex)
              ],
            ),
    );
  }
}
