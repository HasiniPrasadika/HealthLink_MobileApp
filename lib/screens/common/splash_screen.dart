import 'dart:async';

import 'package:flutter/material.dart';
import 'package:health_link/screens/common/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignupPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: size.width * 0.5,
            ),
            Text(
              'HealthLink',
              style: TextStyle(
                color: const Color.fromARGB(255, 112, 112, 112),
                fontSize: size.width * 0.1,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'Pharmacy',
              style: TextStyle(
                color: const Color.fromARGB(255, 159, 159, 159),
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.w800,
              ),
            )
          ],
        ),
      ),
    );
  }
}
