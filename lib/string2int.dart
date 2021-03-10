library string2int;

import 'dart:math';

class String2Int {
  String _original;
  int _pos;
  String _target;
  bool _minus;
  bool _float;
  int _decimalPoint;

  // 初期化時に長ったらしい処理を行うのが良い案なのか？
  String2Int(String data) {
    this._original = data;
    this._pos = 0;
    this._target = data;

    // マイナスに関して
    if (_target.contains('-')) {
      var mp = _target.indexOf('-');
      // 先頭以外にある場合
      if (mp != 0) {
        throw Exception('Minus must be on the head of string.');
      }
      // 複数あった場合
      if ('-'.allMatches(_target).length != 1) {
        throw Exception('Minus must not exist more than one.');
      }
      // 取り除いて、真に
      _target = _target.replaceAll('-', '');
      _minus = true;
    } else {
      _minus = false;
    }
    // 小数点に関して
    if (_target.contains('.')) {
      var dp = _target.indexOf('.');
      // 先頭にある場合
      if (dp == 0) {
        throw Exception('Decimal Point must not be on the head of string.');
      }
      // 複数あった場合
      if ('.'.allMatches(_target).length != 1) {
        throw Exception('Decimal Point must not exist more than one.');
      }
      _target = _target.replaceAll('.', '');
      _decimalPoint = dp;
      _float = true;
    } else {
      _decimalPoint = _target.length;
      _float = false;
    }
  }

  // for debug
  void showState() {
    print('input: $_original');
    print('edited: $_target');
    print('pos: $_pos');
    print('minus: $_minus');
    print('float: $_float');
    print('decimal_point: $_decimalPoint');
    print('-----------------------');
  }

  bool _isEof() {
    return _target.length <= _pos;
  }

  String _getChar() {
    return String.fromCharCode(_target.runes.elementAt(_pos));
  }

  String _consumeChar() {
    var c = _getChar();
    _pos++;
    return c;
  }

  int _exchange(String n) {
    switch(n) {
      case '1': return 1;
      case '2': return 2;
      case '3': return 3;
      case '4': return 4;
      case '5': return 5;
      case '6': return 6;
      case '7': return 7;
      case '8': return 8;
      case '9': return 9;
      case '0': return 0;
      default: throw Exception('Exchange: param n must be in 1234567890.');
    }
  }

  num calc() {
    num result = 0;

    while (!_isEof()) {
      var c = _consumeChar();
      var num = _exchange(c);
      if (num != 0) {
        var ruijo = pow(10, (_decimalPoint - _pos));
        var r = num * ruijo;
        result += r;
      }
    }

    if (_minus) {
      result *= -1;
    }

    return result;
  }

}
