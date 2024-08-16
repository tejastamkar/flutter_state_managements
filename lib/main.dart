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
      title: 'Meals App',
      theme: ThemeData().copyWith(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.yellowAccent.shade700,
              brightness: Brightness.light),
          cardColor: context.colorScheme.primaryContainer,
          scaffoldBackgroundColor: ColorScheme.fromSeed(
                  seedColor: Colors.yellowAccent.shade700,
                  brightness: Brightness.light)
              .surface,
          textTheme: GoogleFonts.latoTextTheme()),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorScheme.fromSeed(
                  seedColor: Colors.yellowAccent.shade700,
                  brightness: Brightness.dark)
              .surface,
          cardColor: context.colorScheme.primaryContainer,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.yellowAccent.shade700,
              brightness: Brightness.dark),
          textTheme: GoogleFonts.latoTextTheme()),
      routes: AppPages.routes,
      initialRoute: AppPages.initial,
    );
  }
}
