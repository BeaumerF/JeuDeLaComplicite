import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String labelText;
  final BoxDecoration decoration;

  const CustomContainer({this.labelText, this.decoration});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 80,
        ),
        Positioned(
          bottom: 0,
          child: Container(width: 250, height: 50, decoration: decoration),
        ),
        Positioned(
          left: 10,
          bottom: 40,
          child: Container(color: Colors.white, child: Text('XP')),
        )
      ],
    );
  }
}
