import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Payment_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blueGrey[900],
          scaffoldBackgroundColor: Colors.blueGrey),
      home: Paymentscreen(),
    ),
  );
}
