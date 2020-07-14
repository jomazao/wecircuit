import 'package:wecircuit/electronics_core/components/component.dart';

class Connection {
  final int connector;
  final Component component;

  Connection(
    this.component,
    this.connector,
  );
}
