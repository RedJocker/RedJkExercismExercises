class AllYourBase {
  rebase(int baseFrom, List<int> digitsBaseFrom, int baseTo) {
    if (baseFrom <= 1 || baseTo <= 1)
      throw ArgumentError();

    Iterable<int> generateNewBaseRev() sync* {

      int number = digitsBaseFrom.fold(0, (a, c) {
        if (c >= baseFrom || c < 0)
          throw ArgumentError();
        return (a * baseFrom) + c;
      });

      if (number == 0)
        yield 0;
      while (number != 0) {
        yield number % baseTo;
        number ~/= baseTo;
      }
    }

    return generateNewBaseRev().toList().reversed;
  }
  // Put your code here
}
