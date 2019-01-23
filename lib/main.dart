import 'package:flutter/material.dart';
import 'dart:math';

import './prim_zahl.dart';
import './teilerfremder.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: primNumber function twice
    // rsa_Verschuesselung();

    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  // String a = primNumber();

  String data = 'Prime 1: ' +
      '\n' +
      'Prime 2: ' +
      '\n' +
      'N: ' +
      '\n' +
      'Phi(n): ' +
      '\n' +
      'Teilerfremder: ' +
      '\n' +
      'd: ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('RSA-Verschlüsselung'),
            // TODO: print public key, private key... (show in app)
          ),
          body: Column(
            children: [
              RaisedButton(
                child: Text('CALC'),
                onPressed: () {
                  setState(() {
                    data = rsa_Verschuesselung();
                  });
                },
              ),
              Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(data, style: TextStyle(fontSize: 50)))
            ],
          )),
    );
  }
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

  String getdata = 'Prime 1: ' +
      prime1.toString() +
      '\n' +
      'Prime 2: ' +
      prime2.toString() +
      '\n' +
      'N: ' +
      n.toString() +
      '\n' +
      'Phi(n): ' +
      phiVonN.toString() +
      '\n' +
      'Teilerfremder: ' +
      e.toString() +
      '\n' +
      'd: ';

  return getdata;
}
