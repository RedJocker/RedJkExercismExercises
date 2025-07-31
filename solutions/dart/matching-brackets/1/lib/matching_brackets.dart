class MatchingBrackets {

  bool _isBracket(String s) => s.contains(RegExp(r"^[(){\}\[\]]$"));
  bool _isOpenBracket(String s) => s.contains(RegExp(r"^[({\[]$"));
  bool _isCloseBracket(String s) => s.contains(RegExp(r"^[)\}\]]$"));

  bool _isMatchingBrace(String open, String close) {
    return switch(open) {
      "[" => close == "]",
      "(" => close == ")",
      "{" => close == "}",
      String() => false,
    };
  }

  isPaired(String s) {
    var braces = s.split("").where(_isBracket).toList(growable: false);
    List<String> stack = List.empty(growable: true);

    for (var brace in braces) {
      if (_isOpenBracket(brace)) {
        stack.add(brace);
      } else if (_isCloseBracket(brace)) {
        var topStack = stack.lastOrNull ?? "";
        if (!_isMatchingBrace(topStack, brace))
          return false;
        stack.removeLast();
      } else {
        throw Exception("unexpected path");
      }
    }
    return stack.isEmpty;
  }
}
