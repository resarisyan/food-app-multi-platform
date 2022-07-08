import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/src/ui/main/Keranjang.dart';
import 'package:food_app/src/ui/main/Login.dart';
import 'package:food_app/src/ui/main/Pemesanan.dart';

class AddCartButton extends StatelessWidget {
  VoidCallback tambahKeranjang;
  String? id_pelanggan;
  VoidCallback? getTotalItem;
  bool isLogin;

  AddCartButton(
      {required this.tambahKeranjang,
      required this.isLogin,
      required this.id_pelanggan,
      required this.getTotalItem});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20.0),
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                border: Border.all(color: Colors.lightBlue[800]!)),
            child: IconButton(
              hoverColor: Colors.lightBlue[800],
              highlightColor: Colors.transparent,
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.lightBlue[800],
              ),
              onPressed: () {
                if (isLogin) {
                  tambahKeranjang();
                } else {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                      (router) => false);
                }
              },
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50.0,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                color: Colors.lightBlue[800],
                child: Text(
                  'Pesan Sekarang'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'Varela',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onPressed: () {
                  if (isLogin) {
                    tambahKeranjang();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Keranjang(
                                  getTotalItem: getTotalItem!,
                                  id_pelanggan: id_pelanggan!,
                                )));
                  } else {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                        (router) => false);
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
