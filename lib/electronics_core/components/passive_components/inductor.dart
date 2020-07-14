import 'package:wecircuit/electronics_core/components/passive_component.dart';

import '../../complex_number.dart';

class Inductor extends PassiveComponent {
  double get inductance => value;
  double get h => value;
  String get units => "Farads";
  Inductor(double inductance) : super(inductance);

  Inductor operator +(Inductor inductor) =>
      Inductor(this.value + inductor.value);

  Inductor operator |(Inductor inductor) =>
      Inductor(1 / (1 / this.value + 1 / inductor.value));

  ComplexNumber get impedance {
    double imaginary = activeCircuit.w * value;
    return ComplexNumber(real: 0, imaginary: imaginary);
  }
}
