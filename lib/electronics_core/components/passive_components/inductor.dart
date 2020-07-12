import 'package:wecircuit/electronics_core/components/passive_component.dart';

class Inductor extends PassiveComponent {
  double get inductance => value;
  double get h => value;
  Inductor(double inductance) : super(value: inductance);

  Inductor operator +(Inductor inductor) => Inductor(this.value + this.value);

  Inductor operator |(Inductor inductor) =>
      Inductor(1 / this.value + 1 / this.value);
}
