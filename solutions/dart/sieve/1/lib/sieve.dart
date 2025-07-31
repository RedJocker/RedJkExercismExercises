class Sieve {
  int last;

  Sieve(this.last);

  get primes {
    Iterable<int> candidatesGenerator () sync* {
      if (last >= 2)
        yield 2;
      for (int i = 3; i <= this.last; i += 2) {
        yield i;
      }
    }

    Iterable<int> primesGenerator () sync* {
      Iterable<int> candidates = candidatesGenerator();
      while (candidates.isNotEmpty) {
        int x = candidates.first;
        yield x;
        candidates = candidates.where((c) => c % x != 0);
      }
    }

    return primesGenerator().toList();
  }
}
