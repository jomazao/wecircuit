import 'dart:math';

import 'package:wecircuit/electronics_core/components/component.dart';
import 'package:wecircuit/electronics_core/frequency.dart';

import 'node.dart';

class Circuit with Frequency {
  List<Component> _components = [];
  List<Node> nodes = [];

  void connectComponent() {}
}
