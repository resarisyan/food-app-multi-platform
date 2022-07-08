import 'package:bmnav_null_safety/bmnav_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/ui/main/Akun.dart';
import 'package:food_app/src/ui/main/Home.dart';
import 'package:food_app/src/ui/main/Login.dart';
import 'package:food_app/src/ui/main/Transaksi.dart';
import 'package:food_app/src/utility/SessionManager.dart';

class MainNavigation extends StatefulWidget {
  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  late int _currentIndex;
  var page;
  late bool isLogin;
  late String id_pelanggan;

  @override
  void initState() {
    _currentIndex = 0;
    page = Home();

    _getLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(isLogin);
    return Scaffold(
      body: page,
      bottomNavigationBar: BottomNav(
        color: Colors.white,
        labelStyle: LabelStyle(
            visible: true,
            showOnSelect: false,
            onSelectTextStyle: TextStyle(
              color: Colors.grey,
              height: 1.8,
            ),
            textStyle: const TextStyle(color: Colors.grey, height: 1.8)),
        iconStyle:
            IconStyle(color: Colors.grey[400], onSelectSize: 22.0, size: 22.0),
        elevation: 6.0,
        onTap: (i) {
          _currentIndex = i;
          _currentPage(i);
        },
        index: _currentIndex,
        items: [
          BottomNavItem(icon: Icons.home, label: 'Home'),
          BottomNavItem(icon: Icons.assignment, label: 'Transaksi'),
          BottomNavItem(icon: Icons.person, label: 'Akun'),
        ],
      ),
    );
  }

  void _currentPage(int i) {
    if (i == 0) {
      setState(() {
        page = Home();
      });
    } else if (i == 1) {
      if (isLogin) {
        setState(() {
          page = Transaksi(
            id_pelanggan: id_pelanggan,
          );
        });
      } else {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Login()), (route) => false);
      }
    } else {
      if (isLogin) {
        setState(() {
          page = Akun();
        });
      } else {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Login()), (route) => false);
      }
    }
  }

  _getLogin() async {
    bool _isLogin = await SessionManager().getIsLogin();
    String _id = await SessionManager().getIdPelanggan();

    setState(() {
      isLogin = _isLogin;
      id_pelanggan = _id;
    });
  }
}
