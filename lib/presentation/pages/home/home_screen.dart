import 'package:flutter/material.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meals"),
        centerTitle: context.isTablet ? false : true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "hello",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onPrimaryContainer),
          ),
        ],
      ),
    );
  }
}
