import 'package:wecircuit/electronics_core/complex_number.dart';

mixin Power {
  ComplexNumber power;
  ComplexNumber get P => power;
  set P(ComplexNumber P) => power = P;
}
