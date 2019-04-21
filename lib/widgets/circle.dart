// (c) 2019 hush2. https://github.com/hush2

import 'package:flutter/material.dart';

class Circle extends StatefulWidget {
  final Color color;

  Circle({Key key, this.color}) : super(key: key);

  @override
  _CircleState createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: widget.color,
        shape: BoxShape.circle,
      ),
    );
  }
}
