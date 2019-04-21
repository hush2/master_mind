// (c) 2019 hush2. https://github.com/hush2

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

List<Color> colorList = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
];

class AppState extends Model {
  bool gameRunning;
  bool reveal;
  bool solved;
  int activeRow;
  List<List> hints;
  List<Color> secret;
  List<Color> guess;
  List<List<Color>> guesses;

  bool get rowFilled => !guess.contains(null);

  void pegColor(int index, Color color) {
    guess[index] = color;
    guesses[activeRow] = guess;

    notifyListeners();
  }

  void newGame() {
    secret = colorList;
    secret.shuffle();
    secret = secret.sublist(0, 4);

    guess = List(4);
    guesses = List(10);
    hints = List(10);
    activeRow = 0;
    gameRunning = true;
    reveal = false;
    solved = false;

    notifyListeners();
  }

  void nextRow(int row, List<Color> hint) {
    hints[row] = hint;
    activeRow++;
    guess = List(4);

    notifyListeners();
  }

  void stopGame({solved}) {
    this.solved = solved;
    reveal = true;
    gameRunning = false;

    notifyListeners();
  }

  void revealCode() {
    reveal = !reveal;

    notifyListeners();
  }
}
