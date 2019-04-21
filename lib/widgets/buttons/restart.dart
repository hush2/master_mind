// (c) 2019 hush2. https://github.com/hush2

import 'package:flutter/material.dart';

class RestartButton extends StatelessWidget {
  final onPressed;

  RestartButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
//        color: Colors.white10,
        child: IconButton(
          iconSize: 50,
          icon: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
          onPressed: () {
            _showDialog(context, onPressed);
          },
        ),
      ),
    );
  }

  _showDialog(context, onPressed) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New Game?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                onPressed();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
