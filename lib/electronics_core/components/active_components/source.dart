import 'package:wecircuit/electronics_core/complex_number.dart';
import 'package:wecircuit/electronics_core/components/active_component.dart';
import 'package:wecircuit/electronics_core/current.dart';
import 'package:wecircuit/electronics_core/frequency.dart';
import 'package:wecircuit/electronics_core/voltage.dart';

class Source extends ActiveComponent with Frequency, Voltage, Current {
  Source({ComplexNumber voltage, ComplexNumber current}) {
    this.voltage = voltage;
    this.current = current;
  }
}
