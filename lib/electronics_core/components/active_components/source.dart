import 'package:wecircuit/electronics_core/complex_number.dart';
import 'package:wecircuit/electronics_core/components/active_component.dart';
import 'package:wecircuit/electronics_core/current.dart';
import 'package:wecircuit/electronics_core/frequency.dart';
import 'package:wecircuit/electronics_core/voltage.dart';

class Source extends ActiveComponent with Frequency, Voltage, Current {
  SourceType type;

  Source(
      {ComplexNumber voltage = const ComplexNumber(),
      ComplexNumber current = const ComplexNumber()}) {
    this.voltage = voltage;
    this.current = current;
  }

  factory Source.voltage(
    ComplexNumber voltage, {
    SourceType type = SourceType.DC,
    double frequency = 0,
  }) {
    Source source = Source(voltage: voltage);
    source.type = type;
    source.frequency = frequency;
    return source;
  }
  factory Source.current(
    ComplexNumber current, {
    SourceType type = SourceType.DC,
    double frequency = 0,
  }) {
    Source source = Source(current: current);
    source.type = type;
    source.frequency = frequency;
    return source;
  }

  @override
  String toString() {
    return '${this.runtimeType}(Voltage: $voltage Volts, current: $current Amps, type:$type, frequency: $frequency Hz})';
  }
}

enum SourceType { AC, DC }
