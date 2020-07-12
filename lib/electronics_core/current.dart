import 'complex_number.dart';

mixin Current {
  ComplexNumber current;
  ComplexNumber get I => current;
  set I(ComplexNumber I) => current = I;
}
