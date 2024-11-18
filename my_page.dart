import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF020C25),
      body: SingleChildScrollView(
        child: Column(
          children: [
           
            Center(
              child: Text(
                'Hey',
                style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
