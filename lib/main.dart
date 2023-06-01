import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modelsaltita/pages/banda_details.dart';
import 'package:modelsaltita/pages/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intro_pages/intro_page1.dart';
import 'intro_pages/intro_page2.dart';

void main() => runApp(
  const MyApp());

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    PageController controller = PageController(initialPage: 0);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes:  {
        'home': (BuildContext context) => const HomePage(),
        'detalle':(BuildContext context) => const BandaDetails() 
      },
      home: Scaffold(
        
        body: Stack(
          children: [
            PageView(
              controller: controller,
              children: const <Widget>[
                IntroPage1(),
                IntroPage2(),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    
                    onTap: () {
                      controller.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    child:Text(
                      'Next',
                      style: GoogleFonts.aladin(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 2,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      dotColor: Colors.white,
                      activeDotColor: Colors.blue,
                      expansionFactor: 4,
                      spacing: 5.0,
                    ),
                  ),
                  
                    
                  const DoneButton(),
                  
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoneButton extends StatelessWidget {
  const DoneButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const HomePage();
        }));
      },
      child: Text(
        'Done',
        style: GoogleFonts.aladin(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
