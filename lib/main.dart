// (c) 2019 hush2. https://github.com/hush2

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

import 'widgets/board.dart';
import 'app_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appState = AppState();

  MyApp() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // Full screen on Android
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Master Mind',
      home: Scaffold(
        body: ScopedModel<AppState>(
          child: Board(),
          model: appState,
        ),
      ),
    );
  }
}
