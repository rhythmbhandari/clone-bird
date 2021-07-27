import 'package:flutter/material.dart';

class CloneBird extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      height: 60,
      width: 60,
      child: Image.asset(
        'lib/images/classybird.png'
      ),
    );
  }
}