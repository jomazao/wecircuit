import 'package:wecircuit/electronics_core/circuits/circuit.dart';
import 'package:wecircuit/electronics_core/components/component.dart';
import 'package:wecircuit/electronics_core/impedance.dart';

import '../complex_number.dart';
import '../current.dart';
import '../power.dart';
import '../voltage.dart';

abstract class PassiveComponent extends Component
    with Impedance, Voltage, Current, Power {
  double value;
  String units = '';

  PassiveComponent(this.value);

  @override
  set current(ComplexNumber current) {
    super.current = current;

    super.voltage = impedance * current;
  }

  @override
  set voltage(ComplexNumber voltage) {
    super.voltage = voltage;

    super.current = voltage / impedance;
  }

  @override
  ComplexNumber get power {
    return voltage * current;
  }

  PassiveComponent.str(String value) {
    RegExp regExp = RegExp('^[0-9]+(\.[0-9]+)?[GMKmunp]\$');
    Iterable<RegExpMatch> matches = regExp.allMatches(value);
  }
  Circuit activeCircuit;

  @override
  String toString() {
    return '${this.runtimeType}(value: $value $units  impedance: ${impedance.toString()} Ohm, voltage: $voltage, current: $current})';
  }
}
