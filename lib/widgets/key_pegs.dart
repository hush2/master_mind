// (c) 2019 hush2. https://github.com/hush2

import 'package:flutter/material.dart';

import 'circle.dart';

class KeyPegs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        KeyPeg(Colors.red),
        KeyPeg(Colors.green),
        KeyPeg(Colors.blue),
        KeyPeg(Colors.yellow),
        KeyPeg(Colors.orange),
        KeyPeg(Colors.purple),
      ],
    );
  }
}

class KeyPeg extends StatelessWidget {
  final Color color;

  KeyPeg(this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Draggable(
        child: Circle(color: color),
        feedback: Circle(color: color),
        data: color,
      ),
    );
  }
}
