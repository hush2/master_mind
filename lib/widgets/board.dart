// (c) 2019 hush2. https://github.com/hush2

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../app_state.dart';
import 'peg_row.dart';
import 'code_pegs.dart';
import 'key_pegs.dart';
import 'buttons/restart.dart';
import 'buttons/info.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  var _appState;

  @override
  void initState() {
    super.initState();

    _appState = ScopedModel.of<AppState>(context);
    _appState.newGame();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: <Widget>[
            leftPanel(),
            rightPanel(),
          ],
        ),
        decoration: BoxDecoration(
          gradient: boardGradient(),
        ));
  }

  leftPanel() {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border(right: BorderSide(color: Colors.white24)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 1, child: InfoButton()),
            Expanded(
                flex: 1,
                child: RestartButton(onPressed: () => _appState.newGame())),
            Expanded(flex: 3, child: KeyPegs()),
          ],
        ),
      ),
    );
  }

  rightPanel() {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CodePegs(),
          PegRow(9),
          PegRow(8),
          PegRow(7),
          PegRow(6),
          PegRow(5),
          PegRow(4),
          PegRow(3),
          PegRow(2),
          PegRow(1),
          PegRow(0),
        ],
      ),
    );
  }

  boardGradient() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF141E30),
        Color(0xFF243B55),
      ],
    );
  }
}
