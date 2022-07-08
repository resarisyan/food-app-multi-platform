import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/src/ui/main/Home.dart';
import 'package:food_app/src/ui/main/MainNavigation.dart';
import 'package:food_app/src/ui/main/SpashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        title: 'Z Restaurant',
        theme: ThemeData(
          textTheme:
              Theme.of(context).textTheme.apply(bodyColor: Color(0xFF535353)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false);
  }
}
