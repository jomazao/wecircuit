import 'package:wecircuit/electronics_core/complex_number.dart';
import 'package:wecircuit/electronics_core/components/active_components/source.dart';
import 'package:wecircuit/electronics_core/components/passive_components/resistor.dart';

import 'electronics_core/circuits/circuit.dart';
import 'electronics_core/math/fs.dart';

class CircuitTest {
  Circuit circuit1;

  void testImpedance() {
    var num = ComplexNumber();
    print(num.toString());
    var num2 = ComplexNumber(real: 2);
    print(num2.toString());
    num += num2;
    print(num.toString());

    var res1 = Resistor(20);
    var res2 = Resistor(10);

    var res3 = res1 + res2;

    var res4 = res1 | res2;

    print(res3);
    print(res4);
  }

  void testSeries() {
    Source source1 = Source.voltage(
      ComplexNumber.real(10),
    );
    var res1 = Resistor(20);
    var res2 = Resistor(10);
    var res3 = Resistor(50);

    Circuit circuit1 = Circuit();

    circuit1.connectFullSeries([source1, res1, res2, res3]);

    print(circuit1.componentsToString());
  }

  void testOhm() {
    var res1 = Resistor(100);
    res1.voltage = ComplexNumber.real(50);
    print(res1.current);
    res1.current = ComplexNumber.real(0.2);
    print(res1.voltage);
    res1.voltage = ComplexNumber.real(20);
    print(res1.current);
  }

  void testSymbolic() {
    Fs tfs1 = Fs(numerator: [1], denominator: [1, 1]);
    Fs tfs2 = Fs(numerator: [1, 1], denominator: [1, 1]);

    var gs = tfs1 * tfs2;

    print(gs.toString());
  }
}
