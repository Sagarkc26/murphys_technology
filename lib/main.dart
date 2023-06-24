import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:murphys_technology/routes.dart';
import 'package:murphys_technology/routes/routesName.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: BottomNB(),
      initialRoute: RoutesName.introduction,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
