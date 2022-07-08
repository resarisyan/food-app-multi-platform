import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_app/src/ui/main/MainNavigation.dart';
import 'package:food_app/src/ui/main/Pemesanan.dart';

class LoadingPemesanan extends StatefulWidget {
  String? id_pelanggan;
  LoadingPemesanan({required this.id_pelanggan});

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LoadingPemesanan> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Pemesanan(id_pelanggan: widget.id_pelanggan!)));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              backgroundColor: Colors.lightBlue[400],
              color: Colors.white,
              strokeWidth: 5,
            ),
          ],
        ),
      ),
    );
  }
}
