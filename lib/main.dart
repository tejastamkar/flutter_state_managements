import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_getx_app/routes/app_pages.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData().copyWith(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.lightBlue, brightness: Brightness.light),
          cardColor: context.colorScheme.primaryContainer,
          scaffoldBackgroundColor: ColorScheme.fromSeed(
                  seedColor: Colors.lightBlue, brightness: Brightness.light)
              .surface,
          textTheme: GoogleFonts.latoTextTheme()),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorScheme.fromSeed(
                  seedColor: Colors.lightBlue, brightness: Brightness.dark)
              .surface,
          cardColor: context.colorScheme.primaryContainer,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.lightBlue, brightness: Brightness.dark),
          textTheme: GoogleFonts.latoTextTheme()),
      routes: AppPages.routes,
      initialRoute: AppPages.initial,
    );
  }
}
