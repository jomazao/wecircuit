import 'package:wecircuit/electronics_core/complex_number.dart';
import 'package:wecircuit/electronics_core/components/component.dart';
import 'package:wecircuit/electronics_core/components/passive_component.dart';
import 'package:wecircuit/electronics_core/frequency.dart';

import 'analysis.dart';
import 'node.dart';

class Circuit with Frequency {
  List<Component> get components {
    var componentList = <Component>[];
    nodes.forEach((node) => componentList.addAll(node.components));
    return componentList.toSet().toList();
  }

  List<Node> nodes = [];

  bool connectComponents({
    Component component1,
    Component component2,
    List<Component> components,
    Node node,
  }) {}

  bool connectTwoComponents(
    Component component1,
    Component component2,
    Node node,
  ) {
    if (node == null) {
      node = nodes.firstWhere(
            (node) => node.hasComponent(component1),
            orElse: null,
          ) ??
          nodes.firstWhere(
            (node) => node.hasComponent(component2),
            orElse: null,
          ) ??
          Node();
      if (nodes.any((element) => element == node)) {
        nodes.add(node);
      }
    }
    node.connect(component1);
    node.connect(component2);
    return true;
  }

  void setFullSeriesCurrent(ComplexNumber current) {
    components.forEach((component) =>
        component is PassiveComponent ? component.current == current : null);
  }

  bool connectFullSeries(List<Component> components) {
    components.forEach((component) {
      if (nodes.isEmpty) {
        Node node = Node();
        node.connect(component, connector: 2);
        nodes.add(node);
      } else {
        nodes.last.connect(component);
      }
      Node node = Node();
      node.connect(component, connector: 2);
      nodes.add(node);

      if (nodes.length == components.length) {
        nodes.last.connect(components.first);
      }
    });
    return true;
  }

  void resolveSeries() {
    ComplexNumber current = Analysis().resolveCurrent(this);
    components.forEach((component) =>
        component is PassiveComponent ? component.current = current : null);
  }

  String componentsToString() {
    resolveSeries();
    String res = '';
    print(components.length);
    components.forEach((element) => res += '${element.toString()},');
    return res;
  }
}
