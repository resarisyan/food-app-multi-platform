import 'package:flutter/material.dart';
import 'package:food_app/src/ui/main/MainNavigation.dart';
import 'package:food_app/src/utility/SessionManager.dart';

class Akun extends StatefulWidget {
  @override
  State<Akun> createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        textTheme: TextTheme(),
        backgroundColor: Colors.white,
        elevation: 1,
        brightness: Brightness.dark,
        title: Text(
          'Akun',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: SizedBox(
                  width: 200,
                  height: 50.0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    color: Colors.red[800],
                    child: Text(
                      'Logout'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Varela',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      SessionManager().removeSession();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainNavigation()),
                          (route) => false);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
