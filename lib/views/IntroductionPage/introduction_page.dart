import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:murphys_technology/routes/routesName.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        scrollPhysics: const BouncingScrollPhysics(),
        pages: [
          PageViewModel(
            titleWidget: const Text(
              "We help you to grow your business",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            body:
                "Write the more description of the page. Write the more description of the page.Write the more deccription of the page,",
            image: Image.asset(
              "images/pic1.png",
              height: 400,
              width: 400,
            ),
          ),
          PageViewModel(
            titleWidget: const Text(
              "Write title of page",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            body:
                "Write the more description of the page. Write the more description of the page.Write the more deccription of the page,",
            image: Image.asset(
              "images/pic2.png",
              height: 400,
              width: 400,
            ),
          ),
          PageViewModel(
            titleWidget: const Text(
              "Write title of page",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            body:
                "Write the more description of the page. Write the more description of the page.Write the more deccription of the page,",
            image: Image.asset(
              "images/pic3.png",
              height: 400,
              width: 400,
            ),
          ),
        ],
        onDone: () {
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(),
            ),
            onPressed: () {},
            child: const Icon(Icons.add),
          );
          Navigator.pushNamed(context, RoutesName.bottomNavBar);
        },
        onSkip: () {
          Navigator.pushNamed(context, RoutesName.bottomNavBar);
        },
        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xff6c63ff),
          ),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: Color(0xff6c63ff),
        ),
        done: const Text(
          "Done",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xff6c63ff),
          ),
        ),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10),
          activeSize: const Size(20, 10),
          color: Colors.black,
          activeColor: const Color(0xff6c63ff),
          spacing: const EdgeInsets.symmetric(horizontal: 3),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(250),
          ),
        ),
      ),
    );
  }
}
