import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(52, 54, 101, 1.0),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Sponsors',
                      speed: const Duration(milliseconds: 500),
                      textStyle: GoogleFonts.aladin(
                        color: Colors.white,
                        fontSize: 80,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
