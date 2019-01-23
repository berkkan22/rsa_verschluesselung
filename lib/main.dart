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
  for (int number = 100; number < 10000; number++) {
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

  int e = teilerfremd(40);

  // print('Prime 1: ');
  // print( prime1);
  // print('Prime 2: ');
  // print( prime2);
}

teilerfremd(int n) {
  // teilerfremden e bestimmen
  // beispiel 7 ist teilerfremd zu 40

  List<int> teilerVonN = [];

  // alle geraden teiler von 40
  for (var i = 1; i < n; i++) {
    if (n % i == 0) {
      if (i != 1) {
        teilerVonN.add(i);
        // print(i);
      }
    }
  }

  // teiler von allen zahlen bis 40
  List<int> teiler = [];
  for (var d = 2; d <= n; d++) {
    // print('for i anfang');
    // print(i);
    for (var k = 1; k <= d; k++) {
      // print('for k anfang');
      // print(k);
      if (d != 1) {
        if (d % k == 0) {
          teiler.add(k);
          // print(k);
        }
      }
    }

    // prüfen ob teiler gemeinsamen teiler mit teilerVonN haben
    teiler.remove(1);
    for (var p = 0; p < teiler.length; p++) {
      // prüfen ob teiler gemeinsamen teiler mit teilerVonN haben
      // print(teiler);
      if (teilerVonN.indexOf(teiler.indexOf(p)) == -1) {
        print(teiler);
        // print(teiler.indexOf(teilerVonN.indexOf(p)));
        
        // break;
      }
    }
    // print(teiler);
    teiler = [];
  }

  print(teilerVonN);
}
