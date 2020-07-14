abstract class Component {
  final String identifier;

  int connectors = 2;

  Component({this.identifier});

  @override
  String toString() {
    return '${this.runtimeType}(identifier: $identifier, connectors: $connectors)';
  }
}
