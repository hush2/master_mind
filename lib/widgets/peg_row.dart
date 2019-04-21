// (c) 2019 hush2. https://github.com/hush2

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../app_state.dart';
import 'peg_hole.dart';
import 'buttons/check.dart';
import 'hint.dart';

class PegRow extends StatelessWidget {
  final int row;

  PegRow(this.row, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppState>(
      builder: (BuildContext context, Widget child, AppState appState) {
        return Container(
          // color: appState.activeRow == row ? Colors.grey[900] : Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PegHole(row: row, slot: 0),
              PegHole(row: row, slot: 1),
              PegHole(row: row, slot: 2),
              PegHole(row: row, slot: 3),
              appState.activeRow <= row
                  ? CheckButton(row: row)
                  : Hint(row: row),
            ],
          ),
        );
      },
    );
  }
}
