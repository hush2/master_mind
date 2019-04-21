// (c) 2019 hush2. https://github.com/hush2

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../app_state.dart';
import 'circle.dart';

class Hint extends StatelessWidget {
  final int row;

  Hint({Key key, this.row}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: ScopedModelDescendant<AppState>(
        builder: (BuildContext context, Widget child, AppState appState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    hintPeg(appState.hints[row][0]),
                    hintPeg(appState.hints[row][2]),
                  ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  hintPeg(appState.hints[row][1]),
                  hintPeg(appState.hints[row][3]),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  hintPeg(color) {
    return SizedBox(height: 10, width: 10, child: Circle(color: color));
  }
}
