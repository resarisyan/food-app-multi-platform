import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_app/src/ui/main/MainNavigation.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainNavigation()));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 150.0),
            Container(
              child: Image.asset("assets/img/logo.png"),
            ),
            SizedBox(height: 30.0),
            CircularProgressIndicator(
              backgroundColor: Colors.lightBlue[400],
              color: Colors.white,
              strokeWidth: 5,
            ),
            Padding(
              padding: EdgeInsets.only(top: 250.0),
              child: Text(
                '@Copyright 2022 - Created By SandBox Company',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
