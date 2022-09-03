import 'package:flutter/material.dart';

class NetflixWidget {
  static final Widget generalButton = Container(
    width: double.maxFinite,
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
        color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(5))),
    child: Text("CONTINUE"),
  );
}
