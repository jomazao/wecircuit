class SymbolicExpression {
  String symbol;
  final List<double> numerator;
  final List<double> denominator;

  SymbolicExpression(
      {this.numerator = const [0], this.denominator = const [1]});

  factory SymbolicExpression.str(String expression) {
    List<double> numerator;
    List<double> denominator;
    return SymbolicExpression(numerator: numerator, denominator: denominator);
  }

  SymbolicExpression operator +(SymbolicExpression expression) {
    List<double> numerator = this.numerator * expression.denominator +
        expression.numerator * this.denominator;
    List<double> denominator = this.denominator * expression.denominator;
    return SymbolicExpression(numerator: numerator, denominator: denominator);
  }

  SymbolicExpression operator -(SymbolicExpression expression) {}

  SymbolicExpression operator *(SymbolicExpression expression) {
    List<double> numerator = this.numerator * expression.numerator;

    List<double> denominator = this.denominator * expression.denominator;
    return SymbolicExpression(numerator: numerator, denominator: denominator)
      ..symbol = this.symbol;
  }

  SymbolicExpression operator /(SymbolicExpression expression) {
    List<double> numerator = this.numerator * expression.denominator;
    List<double> denominator = this.denominator * expression.numerator;
    return SymbolicExpression(numerator: numerator, denominator: denominator);
  }

  @override
  String toString() {
    var expressionStr = new StringBuffer();
    expressionStr.write(partToString(numerator));
    expressionStr
        .write(denominator.isOne() ? '' : ' /  ${partToString(denominator)}');
    return expressionStr.toString();
  }

  String partToString(List<double> numbers) {
    var result = new StringBuffer();
    for (int i = numbers.length - 1; i >= 0; i--) {
      var num = numbers[i];
      result.write(num == 0
          ? ''
          : '${num > 0 ? '+' : num < 0 ? '-' : ''} ${i != 0 && num.abs() == 1 ? '' : num.abs()}${i == 0 ? '' : symbol}${i == 1 || i == 0 ? '' : i} ');
    }
    return result.toString();
  }
}

extension on List<double> {
  List<double> operator +(List<double> terms) {
    List<double> result = [];
    this.length > terms.length
        ? terms.fillUntil(this.length - 1)
        : this.fillUntil(terms.length - 1);

    for (int i = 0; i < this.length; i++) {
      var sum = this[i] + terms[i];
      result.add(sum);
    }
    return result;
  }

  List<double> operator -(List<double> terms) {
    List<double> result = [];
    this.length > terms.length
        ? terms.fillUntil(this.length - 1)
        : this.fillUntil(terms.length - 1);

    for (int i = 0; i < this.length; i++) {
      var sum = this[i] - terms[i];
      result.add(sum);
    }
    return result;
  }

  List<double> operator *(List<double> terms) {
    var result = <double>[];

    for (int i = 0; i < this.length; i++) {
      var n1 = this[i];
      for (int j = 0; j < terms.length; j++) {
        var n2 = terms[j];
        var product = n1 * n2;
        var index = i + j;
        var value = product + result.valueAtIndex(index);
        result.putAtIndex(value, index);
      }
    }

    return result;
  }

  void putAtIndex(double value, int index) {
    this.fillUntil(index);
    this[index] = value;
  }

  double valueAtIndex(int index) {
    var value = 0.0;
    try {
      value = this[index];
    } catch (e) {}

    return value;
  }

  void fillUntil(int index) {
    var lastIndex = this.isEmpty ? -1 : this.lastIndexOf(this.last);
    for (int i = lastIndex + 1; i <= index; i++) {
      this.add(0);
    }
  }

  bool isZero() {
    return !this.any((element) => element != 0);
  }

  bool isOne() {
    if (this[0] != 1) {
      return false;
    }
    return !this.sublist(1).any((element) => element != 0);
  }
}
