// (c) 2019 hush2. https://github.com/hush2

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "MASTER",
              style: textStyle,
              textAlign: TextAlign.center,
            ),
            Text(
              "MIND",
              style: textStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Icon(
              FontAwesomeIcons.info,
              color: Colors.blueGrey[300],
            ),
          ],
        ),
      ),
      onTap: () => _showDialog(context),
    );
  }

  final textStyle = TextStyle(
    fontSize: 12,
    color: Colors.blueGrey[300],
    fontWeight: FontWeight.bold,
  );

  _showDialog(context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text(
              'Master Mind',
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Made in Flutter by',
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Image.asset(
                    'assets/hush2.png',
                    height: 80,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('GITHUB'),
                onPressed: () => launch('https://github.com/hush2/master_mind'),
              ),
              FlatButton(
                child: Text('CLOSE'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
    );
  }
}
