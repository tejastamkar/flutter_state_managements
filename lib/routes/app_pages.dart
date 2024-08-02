import 'package:my_first_getx_app/presentation/pages/home/home_screen.dart';
import 'package:my_first_getx_app/presentation/pages/quiz/quiz_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = {
    Routes.home: (context) => const HomeScreen(),
    Routes.quiz: (context) => const QuizScreen(),
  };
}