import 'package:wecircuit/electronics_core/components/passive_component.dart';

import '../../complex_number.dart';

class Resistor extends PassiveComponent {
  double get resistance => value;
  double get r => value;
  String get units => "Ohms";
  Resistor(double resistance) : super(resistance);

  Resistor operator +(Resistor resistor) =>
      Resistor(this.value + resistor.value);

  Resistor operator |(Resistor resistor) =>
      Resistor(1 / (1 / this.value + 1 / resistor.value));

  ComplexNumber get impedance => ComplexNumber(real: value);
}
