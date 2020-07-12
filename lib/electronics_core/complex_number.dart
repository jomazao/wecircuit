import 'dart:math';

class ComplexNumber {
  final double real;
  final double imaginary;
  double get i => real;
  double get j => imaginary;

  ComplexNumber({this.real = 0, this.imaginary = 0});

  ComplexNumber operator +(ComplexNumber complexNumber) {
    return ComplexNumber(
        real: this.real + complexNumber.real,
        imaginary: this.imaginary + complexNumber.imaginary);
  }

  ComplexNumber operator |(ComplexNumber complexNumber) {
    final double r1 = this.i;
    final double x1 = this.j;
    final double r2 = complexNumber.i;
    final double x2 = complexNumber.j;

    final double r1r2 = r1 * r2;
    final double x1x2 = x1 * x2;
    final double x1r2 = x1 * r2;
    final double x2r1 = x2 * r1;
    double den = r1r2 ^ 2 + x1x2 ^ 2;
    double real = ((r1r2 - x1x2) * (r1 + r2) + (x1r2 + x2r1) * (x1 + x2)) / den;
    double imaginary =
        ((x1r2 + x2r1) * (r1 + r2) - (r1r2 - x1x2) * (x1 + x2)) / den;

    return ComplexNumber(real: real, imaginary: imaginary);
  }

  ComplexNumber operator *(ComplexNumber complexNumber) {
    final double r1 = this.i;
    final double x1 = this.j;
    final double r2 = complexNumber.i;
    final double x2 = complexNumber.j;
    final double r1r2 = r1 * r2;
    final double r1x2 = r1 * x2;
    final double x1r2 = x1 * r2;
    final double x1x2 = x1 * x2;
    double real = r1r2 - x1x2;
    double imaginary = r1x2 + x1r2;
    return ComplexNumber(real: real, imaginary: imaginary);
  }

  ComplexNumber operator /(ComplexNumber complexNumber) {
    final double r1 = this.i;
    final double x1 = this.j;
    final double r2 = complexNumber.i;
    final double x2 = complexNumber.j;
    final double r1r2 = r1 * r2;
    final double r1x2 = r1 * x2;
    final double x1r2 = x1 * r2;
    final double x1x2 = x1 * x2;
    double den = r2 ^ 2 + x2 ^ 2;
    double real = (r1r2 + x1x2) / den;
    double imaginary = (x1r2 - r1x2) / den;
    return ComplexNumber(real: real, imaginary: imaginary);
  }

  @override
  String toString() {
    return '$i + i$j';
  }
}

extension on double {
  operator ^(double exponent) => pow(this, exponent);
}
