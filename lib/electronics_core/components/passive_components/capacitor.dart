import 'package:wecircuit/electronics_core/components/passive_component.dart';

class Capacitor extends PassiveComponent {
  double get capacitance => value;
  double get c => value;
  Capacitor(double capacitance) : super(value: capacitance);

  Capacitor operator +(Capacitor capacitor) =>
      Capacitor(1 / this.value + 1 / this.value);

  Capacitor operator |(Capacitor capacitor) =>
      Capacitor(this.value + this.value);
}
