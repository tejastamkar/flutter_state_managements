import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_getx_app/screens/home_screen.dart';
import 'package:my_first_getx_app/utils/utils.dart';

Future<void> main() async {
  await registerServices();
  await registerControllers();
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
        '/home': (context) => const MyHomePage(),
      },
      initialRoute: '/home',
    );
  }
}
