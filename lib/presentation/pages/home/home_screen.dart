import 'package:flutter/material.dart';
import 'package:my_first_getx_app/routes/app_pages.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onPressStartQuiz() {
    Navigator.of(context).pushNamed(Routes.quiz);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
              Color.fromARGB(255, 43, 0, 64),
              Color.fromARGB(255, 89, 0, 243)
            ])),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: context.isDesktop
                      ? context.width / 3
                      : context.width - 100,
                  child: Image.asset(
                    "assets/images/quiz-logo.png",
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Text(
                  "Learn Flutter the fun way!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: context.isDesktop ? 30 : 20),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                    ),
                    onPressed: onPressStartQuiz,
                    iconAlignment: IconAlignment.end,
                    icon: Icon(Icons.arrow_right_alt_sharp,
                        color: Colors.white, size: context.isDesktop ? 40 : 30),
                    label: Text(
                      "Start Quiz",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: context.isDesktop ? 30 : 20),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
