import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/ui/main/Keranjang.dart';

AppBar AppBarDetail(
    {required BuildContext context,
    required int totalItem,
    required String id_pelanggan,
    required bool isLogin,
    required VoidCallback getTotalItem,
    required VoidCallback getTotalItemHome}) {
  return AppBar(
    backgroundColor: Colors.lightBlue[800],
    elevation: 0.0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
        getTotalItemHome();
      },
      icon: Icon(
        Icons.chevron_left,
        size: 32.0,
      ),
    ),
    actions: [
      Badge(
          badgeContent: Text(
            '$totalItem',
            style: TextStyle(color: Colors.black, fontSize: 10.0),
          ),
          showBadge: totalItem == 0 ? false : true,
          position: BadgePosition.bottomStart(bottom: 5.0, start: 4.0),
          badgeColor: Colors.white,
          toAnimate: true,
          animationDuration: Duration(milliseconds: 200),
          animationType: BadgeAnimationType.scale,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Keranjang(
                          id_pelanggan: id_pelanggan,
                          getTotalItem: getTotalItem)));
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          )),
    ],
  );
}
