import 'package:flutter/material.dart';

import 'dart:math';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: primNumber function twice
    rsa_Verschuesselung();

    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  // String a = primNumber();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('RSA-Verschlüsselung'),
          // TODO: print public key, private key... (show in app)
        ),
        body: Center(
            // child: Text(a),
            ),
      ),
    );
  }
}

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

rsa_Verschuesselung() {
  int prime1 = primNumber();
  int prime2 = primNumber();

  // n berechnen
  int n = prime1 * prime2;
  int phiVonN = (prime1 - 1) * (prime2 - 1);

  int e = teilerfremd(phiVonN);

  print('Prime 1: $prime1');
  print('Prime 2: $prime2');
  print('Phi(n): $phiVonN');
}

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
  // print(teilerVonN);
}
