teilerfremd(int n) {
  // teilerfremden e bestimmen
  // beispiel 7 ist teilerfremd zu 40

  List<int> teilerVonN = [];

  // alle geraden teiler von 40
  for (var i = 1; i <= n; i++) {
    if (n % i == 0) {
      if (i != 1) {
        teilerVonN.add(i); // [2, 4, 5, 8, 10, 20, 40]
        // print(i);
      }
    }
  }

  // teiler von allen zahlen bis 40
  List<int> teiler = [];
  var k;
  for (var i = 2; i <= n; i++) {
    for (var d = 2; d < i + 1; d++) {
      if (i % d == 0) {
        teiler.add(d);
      }
    }

    for (var i = 0; i < teiler.length; i++) {
      teiler.remove(1);
      if (teilerVonN.indexOf(teiler[i]) != -1) {
        teiler = [];
        break;
      } else {
        // print(teiler);

        // kann die teilerfremden in einer liste speicher anstant in k
        // und könnte zufällig aus der liste wählen
        k = teiler[i];
        teiler = [];
      }
    }
  }
  print('Teilerfremder $k');
  return k;
  // print(teilerVonN);
}