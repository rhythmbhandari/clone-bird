import 'package:flutter/material.dart';

class Obstacles extends StatelessWidget {
  final oHeight;
  Obstacles({this.oHeight});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: oHeight,
      decoration: BoxDecoration(
        color: Color.fromRGBO(68, 61, 76, 1),
        border: Border.all(width: 10, color: Colors.grey.shade900),
        borderRadius: BorderRadius.circular(35)
      ),
    );
  }
}