import 'package:flutter/material.dart';
import 'package:murphys_technology/routes/routesName.dart';
import 'package:murphys_technology/views/IntroductionPage/int.dart';
import 'package:murphys_technology/views/bottomNavBar/bot.dart';
import 'package:murphys_technology/views/homepage/homepage.dart';
import 'package:murphys_technology/views/login.dart';
import 'package:murphys_technology/views/pricing/pricing.dart';
import 'package:murphys_technology/views/signup.dart';
import 'package:murphys_technology/views/splash_screen/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash_screen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RoutesName.introduction:
        return MaterialPageRoute(
          builder: (context) => const IntSlider(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case RoutesName.dashboard:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case RoutesName.price:
        return MaterialPageRoute(
          builder: (context) => const PricingPage(),
        );
      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        );
      case RoutesName.bottomNavBar:
        return MaterialPageRoute(
          builder: (context) => const BottomNB(index: 0),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text("No routes defined")),
          ),
        );
    }
  }
}
