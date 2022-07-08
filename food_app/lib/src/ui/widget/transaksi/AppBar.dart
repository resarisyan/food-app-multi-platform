import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    textTheme: TextTheme(),
    backgroundColor: Colors.white,
    elevation: 1,
    brightness: Brightness.dark,
    title: Text(
      'Transaksi',
      style: TextStyle(
        fontFamily: 'Varela',
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.grey[600],
      ),
      textAlign: TextAlign.center,
    ),
  );
}
