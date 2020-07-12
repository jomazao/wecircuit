import 'dart:math';

import 'package:wecircuit/electronics_core/complex_number.dart';
import 'package:wecircuit/electronics_core/current.dart';
import 'package:wecircuit/electronics_core/voltage.dart';

class Impedance extends ComplexNumber with Voltage, Current {
  Impedance({double real, double imaginary})
      : super(real: real, imaginary: imaginary);
}
