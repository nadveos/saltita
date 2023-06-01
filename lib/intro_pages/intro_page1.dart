import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: const [
          
          TitlesText(),
        ],
      ),
    );
  }
}

class TitlesText extends StatelessWidget {
  const TitlesText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromRGBO(52, 54, 101, 1.0),
      body: SafeArea(
        child: Column(
          children: [
            Lottie.network(
                'https://assets10.lottiefiles.com/private_files/lf30_xnjjfyjt.json'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Ahisito',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.aladin(
                      color: Colors.white,
                      fontSize: 120,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Somos'.toUpperCase(),
                    style: GoogleFonts.aladin(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      RotateAnimatedText('Poesia'.toUpperCase(),
                          textStyle: GoogleFonts.aladin(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                          duration: const Duration(milliseconds: 1000)),
                      RotateAnimatedText('Danza'.toUpperCase(),
                          textStyle: GoogleFonts.aladin(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                          duration: const Duration(milliseconds: 1000)),
                      RotateAnimatedText('Arte'.toUpperCase(),
                          textStyle: GoogleFonts.aladin(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                          duration: const Duration(milliseconds: 1000)),
                      RotateAnimatedText('Música'.toUpperCase(),
                          textStyle: GoogleFonts.aladin(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                          duration: const Duration(milliseconds: 1000)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
