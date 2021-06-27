import 'package:flutter/material.dart';

class Productpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('images/diamond.png'),
        ),
      ),
      appBar: AppBar(
        title: Text('I AM RICH'),
      ),
    );
  }
}
