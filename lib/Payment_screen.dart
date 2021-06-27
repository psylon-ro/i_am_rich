import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cashfree_pg/cashfree_pg.dart';
import 'Product_Screen.dart';

class Paymentscreen extends StatefulWidget {
  @override
  _PaymentscreenState createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
  var orderid;
  String valuee;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I AM RICH'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Material(
            elevation: 2.0,
            color: Colors.blueGrey[900],
            borderRadius: BorderRadius.circular(30.0),
            child: MaterialButton(
              onPressed: () {
                setState(() async {
                  orderid = Random().nextInt(100000000) + 1;
                  await payment();
                  if (valuee == 'SUCCESS') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Productpage();
                        },
                      ),
                    );
                  }
                });
              },
              minWidth: 250.0,
              height: 42.0,
              child: Text(
                'Click to buy the diamond',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  payment() async {
    http.Response res = await http.post(
      Uri.parse('https://test.cashfree.com/api/v2/cftoken/order'),
      headers: <String, String>{
        "x-client-id": '80469a581d9fa2f678b72bb4796408',
        "x-client-secret": '5f858c48d55d193fc8ed05131cb63afa46862b1c'
      },
      body: jsonEncode(<String, String>{
        "orderId": "orderid$orderid",
        "orderAmount": "1",
        "orderCurrency": "INR"
      }),
    );
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      Map<String, dynamic> params = {
        "orderId": "orderid$orderid",
        "orderAmount": "1",
        "customerName": "aaaaaaa",
        "orderCurrency": "INR",
        "appId": '80469a581d9fa2f678b72bb4796408',
        "oderId": '5f858c48d55d193fc8ed05131cb63afa46862b1c',
        "customerPhone": "9767077335",
        "customerEmail": "upendra@gmail.com",
        "stage": "TEST",
        "tokenData": map['cftoken']
      };
      Map<dynamic, dynamic> postData;
      postData = await CashfreePGSDK.doPayment(params);
      valuee = postData['txStatus'];
      print(valuee);
    }
  }
}
