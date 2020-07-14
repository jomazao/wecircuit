import 'package:wecircuit/electronics_core/complex_number.dart';

mixin Voltage {
  ComplexNumber voltage;
  ComplexNumber get V => voltage;
  set V(ComplexNumber V) => voltage = V;
  double vpp;
  double vp;
  double vrms;
}
