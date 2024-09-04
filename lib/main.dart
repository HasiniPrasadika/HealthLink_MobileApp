import 'package:flutter/material.dart';
import 'package:health_link/const/colors.dart';
import 'package:health_link/screens/common/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: NavyBlue),
        useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: NavyBlue,
          selectionHandleColor: NavyBlue,
          selectionColor: BlueGreen,
        ),
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
    );
  }
}
