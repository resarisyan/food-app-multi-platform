import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool isFavorite = false;

  IconData btnIcon = Icons.favorite_outline;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 32.0,
        height: 32.0,
        child: IconButton(
            icon: Icon(btnIcon, color: Colors.red, size: 30.0),
            onPressed: () {
              if (!isFavorite) {
                setState(() {
                  btnIcon = Icons.favorite;
                  isFavorite = true;
                });
              } else {
                setState(() {
                  btnIcon = Icons.favorite_outline;
                  isFavorite = false;
                });
              }
            }));
  }
}
