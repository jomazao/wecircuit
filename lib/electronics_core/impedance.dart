import 'package:wecircuit/electronics_core/complex_number.dart';

mixin Impedance {
  ComplexNumber impedance;
  ComplexNumber get Z => impedance;
  set Z(ComplexNumber Z) => impedance = Z;
}
