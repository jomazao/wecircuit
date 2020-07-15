import 'package:wecircuit/electronics_core/circuits/circuit.dart';
import 'package:wecircuit/electronics_core/complex_number.dart';
import 'package:wecircuit/electronics_core/components/active_components/source.dart';
import 'package:wecircuit/electronics_core/components/component.dart';
import 'package:wecircuit/electronics_core/components/passive_component.dart';

class Analysis {
  ComplexNumber resolveCurrent(Circuit circuit) {
    ComplexNumber totalVoltage = circuit.components
        .where((component) => component is Source)
        .toList()
        .map<ComplexNumber>((component) => (component as Source).voltage)
        .reduce((value, voltage) => value + voltage);
    print(totalVoltage);
    ComplexNumber totalImpedance = circuit.components
        .where((component) => component is PassiveComponent)
        .toList()
        .map<ComplexNumber>(
            (component) => (component as PassiveComponent).impedance)
        .reduce((value, impedance) => (value) + impedance);

    return totalVoltage / totalImpedance;
  }
}
