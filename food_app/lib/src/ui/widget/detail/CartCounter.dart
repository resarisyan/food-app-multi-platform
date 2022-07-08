import 'package:flutter/material.dart';

SizedBox CartCounter(
    {required IconData icon,
    required Color color,
    required VoidCallback press}) {
  return SizedBox(
    width: 40.0,
    height: 32.0,
    child: OutlineButton(
      padding: EdgeInsets.zero,
      hoverColor: color,
      highlightedBorderColor: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
      onPressed: press,
      child: Icon(
        icon,
        color: color,
      ),
    ),
  );
}
