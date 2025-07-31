class EggCounter {

  int count(int num) {
    int c = 0;
    int n = num;
    while (n != 0){
      c += n & 1;
      n = n >> 1;
    }
    return c;
  }
}
