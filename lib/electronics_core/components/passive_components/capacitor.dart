import 'package:wecircuit/electronics_core/complex_number.dart';
import 'package:wecircuit/electronics_core/components/passive_component.dart';

class Capacitor extends PassiveComponent {
  double get capacitance => value;
  double get c => value;
  String get units => "Farads";
  Capacitor(double capacitance) : super(capacitance);

  Capacitor operator +(Capacitor capacitor) =>
      Capacitor(1 / (1 / this.value + 1 / capacitor.value));

  Capacitor operator |(Capacitor capacitor) =>
      Capacitor(this.value + capacitor.value);

  ComplexNumber get impedance {
    double imaginary = -1 / (activeCircuit.w * value);
    return ComplexNumber(real: double.infinity, imaginary: imaginary);
  }
}
