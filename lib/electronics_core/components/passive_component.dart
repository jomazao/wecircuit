import 'package:flutter/cupertino.dart';
import 'package:wecircuit/electronics_core/circuits/circuit.dart';
import 'package:wecircuit/electronics_core/components/component.dart';
import 'package:wecircuit/electronics_core/components/passive_components/capacitor.dart';
import 'package:wecircuit/electronics_core/components/passive_components/inductor.dart';
import 'package:wecircuit/electronics_core/components/passive_components/resistor.dart';
import 'package:wecircuit/electronics_core/impedance.dart';

abstract class PassiveComponent extends Component {
  double value;
  PassiveComponent({@required value});
  PassiveComponent.str(String value) {
    RegExp regExp = RegExp('^[0-9]+(\.[0-9]+)?[GMKmunp]\$');
    Iterable<RegExpMatch> matches = regExp.allMatches(value);
  }
  Circuit activeCircuit;

  Impedance get impedance {
    if (this is Capacitor) {
      double imaginary = -1 / (activeCircuit.w * value);
      return Impedance(imaginary: imaginary);
    }
    if (this is Inductor) {
      double imaginary = activeCircuit.w * value;
      return Impedance(imaginary: imaginary);
    }

    if (this is Resistor) {
      return Impedance(real: value);
    }
    return null;
  }
}
