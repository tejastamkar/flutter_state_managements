import 'dart:math';

import 'package:flutter/material.dart';

final randomize = Random();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imagesList = [
    "assets/images/dice-1.png",
    "assets/images/dice-2.png",
    "assets/images/dice-3.png",
    "assets/images/dice-4.png",
    "assets/images/dice-5.png",
    "assets/images/dice-6.png",
  ];

  int selectedImage = 0;
  void rollDice() {
    setState(() {
      selectedImage = randomize.nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 45, 2, 236),
          Color.fromARGB(255, 86, 17, 245),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DiceBody(
            image: imagesList[selectedImage],
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: rollDice,
            child: const Text(
              "Roll Dice",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )
        ],
      ),
    ));
  }
}

class DiceBody extends StatelessWidget {
  final String image;
  const DiceBody({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        image,
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
