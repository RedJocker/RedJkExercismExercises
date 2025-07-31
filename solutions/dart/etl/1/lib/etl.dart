class Etl {
  Map<String, int> transform(Map<String, List<String>> old) {
    Map<String, int> res = {};

    old.forEach((k, v) {
      int newV = int.parse(k);
      v.forEach((newK) {
        res.putIfAbsent(newK.toLowerCase(), () => newV);
      });
    });
    return res;
  }
}
