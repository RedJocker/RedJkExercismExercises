import 'dart:convert';
import 'dart:math';

class AtbashCipher {
  String _translate(String str) {
    return utf8.decode(str.toLowerCase().codeUnits
        .where((ch) => (ch >= 97 && ch <= 122) || (ch >= 48 && ch <= 57))
        .map((ch) {
      if (ch >= 48 && ch <= 57)
        return ch;
      var norm = ch - 97;
      var rev = 25 - norm;
      return rev + 97;
    }).toList());
  }
  
  String decode(String str) {
    return _translate(str);
  }

  String encode(String str) {
    var decode = _translate(str);
    var res = [];
    for (int i = 0; i < decode.length; i += 5) {
      res.add(decode.substring(i, min(i + 5, decode.length)));
    }
    return res.join(" ");
  }
}
