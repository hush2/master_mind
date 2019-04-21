// (c) 2019 hush2. https://github.com/hush2

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'circle.dart';
import '../app_state.dart';

class CodePegs extends StatefulWidget {
  @override
  _CodePegsState createState() => _CodePegsState();
}

class _CodePegsState extends State<CodePegs> {
  final peg = Circle(color: Colors.blueGrey);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, AppState appState) {
        var secret = appState.secret;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            appState.reveal ? Circle(color: secret[0]) : peg,
            appState.reveal ? Circle(color: secret[1]) : peg,
            appState.reveal ? Circle(color: secret[2]) : peg,
            appState.reveal ? Circle(color: secret[3]) : peg,
            ClipOval(
              child: Container(
                child: IconButton(
                  color: Colors.white54,
                  onPressed: appState.revealCode,
                  icon: Icon(FontAwesomeIcons.eyeSlash),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
