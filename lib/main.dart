import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:murphys_technology/provider/textformfield.dart';
import 'package:murphys_technology/routes.dart';
import 'package:murphys_technology/routes/routesName.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppState(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppState1(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppState2(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppState3(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: BottomNB(),
      initialRoute: RoutesName.splash_screen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
