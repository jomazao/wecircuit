import 'dart:math';

mixin Frequency {
  double frequency = 0;
  double get f => frequency;
  double get w => 2 * pi * f;
  double get angularFrequency => w;
  set f(double f) => frequency = f;
  set w(double w) => frequency = w / (2 * pi);
  set angularFrequency(double angularFrequency) =>
      frequency = angularFrequency / (2 * pi);
}
