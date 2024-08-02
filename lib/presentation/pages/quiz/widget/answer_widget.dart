import 'package:flutter/material.dart';
import 'package:my_first_getx_app/data/model/question_model.dart';
import 'package:my_first_getx_app/domain/use_cases/question_answer.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

class AnswerWidget extends StatelessWidget {
  final QuestionAnswer questionAnswer;

  const AnswerWidget({super.key, required this.questionAnswer});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      primary: true,
      child: Column(
        children: [
          Text(
            "Your Score is ${questionAnswer.userScore} / ${questionAnswer.myQuestions.length}",
            style: TextStyle(
                fontSize: context.isDesktop ? 20 : 16,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          ListView.builder(
            primary: false,
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: questionAnswer.myQuestions.length,
            shrinkWrap: true,
            itemBuilder: (context, questionIndex) {
              QuestionModel questionModel =
                  questionAnswer.myQuestions.elementAt(questionIndex);

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        questionModel.question,
                        style: TextStyle(
                            fontSize: context.isDesktop ? 20 : 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Center(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: questionModel.options.length,
                            itemBuilder: (context, optionsIndex) {
                              Color color = Colors.transparent;
                              if (questionAnswer.answersOfUser
                                      .elementAt(questionIndex) ==
                                  optionsIndex) {
                                color = Colors.red;
                              }

                              if ((questionAnswer.answersOfUser
                                          .elementAt(questionIndex) ==
                                      questionModel.answer) &&
                                  questionAnswer.answersOfUser
                                          .elementAt(questionIndex) ==
                                      optionsIndex) {
                                color = Colors.green;
                              }
                              return Container(
                                width: context.width,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: color,
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(
                                            context.isDesktop ? 200 : 100),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: context.isDesktop ? 2 : 5),
                                      child: Text(
                                        String.fromCharCode(65 + optionsIndex),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: context.isDesktop ? 20 : 16,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      questionModel.options[optionsIndex],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: context.isDesktop ? 20 : 16,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      )
                    ]),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                questionAnswer.resetEverything();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: Text(
                "Home",
                style: TextStyle(
                    color: Colors.white, fontSize: context.isDesktop ? 15 : 10),
              ))
        ],
      ),
    );
  }
}
