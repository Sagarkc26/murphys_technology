import 'package:flutter/material.dart';
import 'package:murphys_technology/routes/routesName.dart';
import 'package:murphys_technology/views/IntroductionPage/int.dart';
import 'package:murphys_technology/views/aboutus/about_us.dart';
import 'package:murphys_technology/views/bottomNavBar/bot.dart';
import 'package:murphys_technology/views/branding/branding.dart';
import 'package:murphys_technology/views/freeQuote/free_quote.dart';
import 'package:murphys_technology/views/homepage/homepage.dart';
import 'package:murphys_technology/views/login.dart';
import 'package:murphys_technology/views/notification/notification.dart';
import 'package:murphys_technology/views/pay_invoice/pay_invoice.dart';
import 'package:murphys_technology/views/pricing/pricing_page.dart';
import 'package:murphys_technology/views/signup.dart';
import 'package:murphys_technology/views/splash_screen/splash_screen.dart';
import 'package:murphys_technology/views/support/support.dart';

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
          builder: (context) => HomePage(),
        );
      case RoutesName.price:
        return MaterialPageRoute(
          builder: (context) => const PricingDetails(),
        );
      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        );
      case RoutesName.bottomNavBar:
        return MaterialPageRoute(
          builder: (context) => const BottomNB(index: 0),
        );

      case RoutesName.contactus:
        return MaterialPageRoute(
          builder: (context) => const SupportScreen(),
        );
      case RoutesName.branding:
        return MaterialPageRoute(
          builder: (context) => const BrandingScreen(),
        );
      case RoutesName.freequote:
        return MaterialPageRoute(
          builder: (context) => const FreeQuote(),
        );
      case RoutesName.payinvoice:
        return MaterialPageRoute(
          builder: (context) => const PayInvoice(),
        );
      case RoutesName.aboutus:
        return MaterialPageRoute(
          builder: (context) => const AboutUs(),
        );
      case RoutesName.notification:
        return MaterialPageRoute(
          builder: (context) => const NotificationScreen(),
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
