// (c) 2019 hush2. https://github.com/hush2

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app_state.dart';

class CheckButton extends StatefulWidget {
  final int row;

  CheckButton({Key key, this.row}) : super(key: key);

  @override
  _CheckButtonState createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppState>(
        builder: (BuildContext context, Widget child, AppState appState) {
      bool rowActive = appState.activeRow == widget.row;
      bool rowFilled = rowActive && appState.rowFilled;
      bool gameRunning = rowActive && appState.gameRunning;

      var icon = FontAwesomeIcons.arrowLeft;
      if (rowFilled) {
        icon = FontAwesomeIcons.check;
      }
      if (!gameRunning) {
        icon = appState.solved
            ? FontAwesomeIcons.solidSmile
            : FontAwesomeIcons.skullCrossbones;
      }
      return Opacity(
        opacity: rowActive ? 1 : 0,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.green[900],
            shape: BoxShape.circle,
          ),
          child: IconButton(
            iconSize: 20,
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            onPressed: () {
              if (gameRunning && rowFilled) {
                var hint = checkColors(appState.guess, appState.secret);
                var correctPegs = hint.where(
                  (value) => value == Colors.red,
                );
                if (correctPegs.length == 4) {
                  appState.stopGame(solved: true);
                  return;
                }
                if (widget.row >= appState.guesses.length - 1) {
                  appState.stopGame(solved: false);
                  return;
                }
                appState.nextRow(widget.row, hint);
              }
              //
            },
          ),
        ),
      );
    });
  }
}

checkColors(guess, secret) {
  var hints = Map<dynamic, dynamic>();

  for (var i = 0; i < secret.length; i++) {
    // Correct color & position
    if (guess[i] == secret[i]) {
      // Use RED since board has a dark background
      hints[guess[i]] = Colors.red;
    } // Correct color, wrong position
    else if (secret.contains(guess[i])) {
      if (hints[guess[i]] != Colors.red) {
        hints[guess[i]] = Colors.white;
      }
    }
  }

  List<Color> cols = [];
  hints.values.toList().forEach((item) => cols.add(item));
  var red = cols.where((item) => item == Colors.red).toList();
  var white = cols.where((item) => item == Colors.white).toList();
  cols = red;
  cols.addAll(white);
  int nulls = secret.length - cols.length;
  for (var i = 0; i < nulls; i++) {
    cols.add(null);
  }

  return cols;
}
