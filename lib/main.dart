import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:murphys_technology/views/provider/delete_account.dart';
import 'package:murphys_technology/views/provider/userdata.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:murphys_technology/routes.dart';
import 'package:murphys_technology/routes/routesName.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:murphys_technology/views/IntroductionPage/int.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString("accessToken");

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MyApp(
        accessToken: accessToken,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String? accessToken;
  const MyApp({
    Key? key,
    this.accessToken,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.loadDataFromSharedPreferences();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoadingScreen(),
      initialRoute: accessToken != null
          ? RoutesName.bottomNavBar
          : RoutesName.splash_screen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        duration: const Duration(seconds: 2),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            // Color(0xff982282),
            // Color(0xffEEA863),
            Colors.black,
            Colors.black87,
          ],
        ),
        childWidget: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 70,
              vertical: MediaQuery.of(context).size.height * 0.1),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/logo.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        defaultNextScreen: const IntSlider(),
      ),
    );
  }

  // void whereToGo() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final accessToken = prefs.getString("accessToken");

  //   if (accessToken != null) {
  //     if (accessToken != null) {
  //       Navigator.pushReplacement(
  //         context as BuildContext,
  //         MaterialPageRoute(
  //           builder: (context) => const BottomNB(index: 1),
  //         ),
  //       );
  //     } else {
  //       Navigator.pushReplacement(
  //         context as BuildContext,
  //         MaterialPageRoute(
  //           builder: (context) => const IntSlider(),
  //         ),
  //       );
  //     }
  //   } else {
  //     Navigator.pushReplacement(
  //       context as BuildContext,
  //       MaterialPageRoute(
  //         builder: (context) => const IntSlider(),
  //       ),
  //     );
  //   }
  // }
}
