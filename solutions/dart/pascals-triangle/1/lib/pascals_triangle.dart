class PascalsTriangle {
  List<List<int>> rows(int n) {
    if (n <= 0)
      return [];
    else if (n == 1)
      return [[1]];

    List<List<int>> res = [[1]];
    var prev = [1];
    for (int i = 2; i <= n; i++) {
      prev = [0, ...prev, 0];
      List<int> cur = [];
      for (int j = 0; j < prev.length - 1; j++){
        cur.add(prev[j] + prev[j + 1]);
      }
      res.add(cur);
      prev = cur;
    }
    return res;
  }
}
