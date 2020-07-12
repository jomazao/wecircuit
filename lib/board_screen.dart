import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wecircuit/analysis_screen.dart';

class BoardScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            FlatButton(
              child: Text("Análisis de circuitos"),
              onPressed: () =>
                  Navigator.pushNamed(context, AnalysisScreen.routeName),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mouseCursor: MouseCursor.defer,
        onPressed: () => null,
      ),
    );
  }
}
