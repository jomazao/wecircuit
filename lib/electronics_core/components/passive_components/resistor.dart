import 'package:wecircuit/electronics_core/components/passive_component.dart';

class Resistor extends PassiveComponent {
  double get resistance => value;
  double get r => value;
  Resistor(double resistance) : super(value: resistance);

  Resistor operator +(Resistor resistor) => Resistor(this.value + this.value);

  Resistor operator |(Resistor resistor) =>
      Resistor(1 / this.value + 1 / this.value);
}
