import 'dart:math';

int primNumber() {
  // TODO: create a list of prime Numbers and than choose randomly a number out of the list
  List<int> primeNumberList = [];
  for (int number = 20; number < 150; number++) {
    int counter = 0;
    for (int teiler = 1; teiler < number + 1; teiler++) {
      if (number % teiler == 0) {
        counter++;
      }
    }
    if (counter == 2) {
      primeNumberList.add(number);
    }
  }
  // print(primeNumberList);
  var randomgenerator = Random();
  int random = randomgenerator.nextInt(primeNumberList.length);
  return primeNumberList[random];
}