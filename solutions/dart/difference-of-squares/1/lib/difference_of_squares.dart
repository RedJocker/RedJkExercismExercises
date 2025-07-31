import 'dart:math';

class DifferenceOfSquares {

  int _sum_pa(int n) {
    return ((1 + n) * n) ~/ (2);
  }

  int squareOfSum(int n) {

    return pow(_sum_pa(n), 2).toInt();
  }

  int sumOfSquares(int n) {
    Iterable<int> nums() sync* {
      for (int i = 1; i <= n; i++)
        yield pow(i, 2).toInt();
    }
    return nums().fold(0, (a, b) => a + b);
  }

  int differenceOfSquares(int n) {
    return squareOfSum(n) - sumOfSquares(n);
  }
}
