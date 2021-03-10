import 'package:flutter_test/flutter_test.dart';

import 'package:string2int/string2int.dart';

void main() {
  // test('adds one to input values', () {
  //   final calculator = Calculator();
  //   expect(calculator.addOne(2), 3);
  //   expect(calculator.addOne(-7), -6);
  //   expect(calculator.addOne(0), 1);
  // });
  test('load value', () {
    final numberOnly = String2Int('123456789');
    numberOnly.showState();
    print('${numberOnly.calc()}');

    final float = String2Int('12.3');
    float.showState();
    print('${float.calc()}');
    final minus = String2Int('-123');
    minus.showState();
    print('${minus.calc()}');
    final floatAndMinus = String2Int('-12.3');
    floatAndMinus.showState();
    print('${floatAndMinus.calc()}');
  });
}
