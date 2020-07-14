import 'package:wecircuit/electronics_core/components/component.dart';
import 'connection.dart';

class Node {
  String identifier;
  List<Connection> connections = [];
  List<Component> get components =>
      connections.map((e) => e.component).toList();
  bool hasComponent(Component component) {
    return connections.firstWhere(
          (element) => element.component == component,
          orElse: null,
        ) !=
        null;
  }

  bool alreadyConnected(Component component, int connector) {
    return connections.any((connection) =>
        connection.component == component && connection.connector == connector);
  }

  bool connect(Component component, {int connector}) {
    if (connector != null) {
      if (alreadyConnected(component, connector)) {
        return false;
      }
      connections.add(Connection(component, connector));
      return true;
    }
    for (int i = 1; i < component.connectors; i++) {
      if (!alreadyConnected(component, i)) {
        connections.add(Connection(component, connector));
        return true;
      }
    }

    return false;
  }
}
