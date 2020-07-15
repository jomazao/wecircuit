import 'package:wecircuit/electronics_core/math/symbolic_expression.dart';

class Fs extends SymbolicExpression {
  Fs({
    List<double> numerator = const [0],
    List<double> denominator = const [1],
  }) : super(
          numerator: numerator,
          denominator: denominator,
        ) {
    super.symbol = "s";
  }
}
