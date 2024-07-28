import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_getx_app/presentation/modules/home/home_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Demo App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
          textTheme: GoogleFonts.quicksandTextTheme()),
      routes: {
        '/': (context) => const HomeScreen(),
      },
      initialRoute: '/',
    );
  }
}
