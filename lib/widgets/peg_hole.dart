// (c) 2019 hush2. https://github.com/hush2

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../app_state.dart';
import 'circle.dart';

class PegHole extends StatefulWidget {
  final int row;
  final int slot;

  PegHole({Key key, this.row, this.slot}) : super(key: key);

  @override
  PegHoleState createState() => PegHoleState();
}

class PegHoleState extends State<PegHole> {
  @override
  Widget build(BuildContext context) {
    var appState = ScopedModel.of<AppState>(context);
    var guesses = appState.guesses;

    Color color;
    if (guesses[widget.row] != null &&
        guesses[widget.row][widget.slot] != null) {
      color = guesses[widget.row][widget.slot];
    } else {
      color = Colors.white12;
    }

    return Container(
      child: DragTarget(
          builder: (context, List<Color> candidateData, rejectedData) {
        return Circle(color: color);
      }, onAccept: (color) {
        if (appState.gameRunning && appState.activeRow == widget.row) {
          appState.pegColor(widget.slot, color);
        }
      }),
    );
  }
}
