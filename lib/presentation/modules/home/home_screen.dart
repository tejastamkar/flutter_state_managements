import 'dart:math';

import 'package:flutter/material.dart';

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
      selectedImage = Random().nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DiceBody(
              image: imagesList[selectedImage],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: rollDice,
              child: const Text(
                "Roll Dice",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
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
