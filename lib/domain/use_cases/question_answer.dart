import 'package:my_first_getx_app/constants/data.dart';
import 'package:my_first_getx_app/data/model/question_model.dart';

class QuestionAnswer {
  int currentIndex = 0;
  List answersOfUser = [];
  bool showAnswerSheet = false;
  int userScore = 0;

  List<QuestionModel> get myQuestions {
    return questions;
  }

  resetEverything() {
    currentIndex = 0;
    userScore = 0;
    answersOfUser.clear();
    showAnswerSheet = false;
  }

  onPressSelectOption(selectedAnswer) {
    if (currentIndex < questions.length - 1) {
      currentIndex++;
      answersOfUser.add(selectedAnswer);
    } else {
      showAnswerSheet = true;
      answersOfUser.add(selectedAnswer);
      for (int i = 0; i < answersOfUser.length; i++) {
        if (questions[i].answer == answersOfUser[i]) {
          userScore++;
        }
      }
    }
  }
}
