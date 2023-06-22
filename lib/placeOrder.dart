import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool orderPlaced = false;

  void placeOrder() {
    // Logic to place the order
    // You can add your own implementation here, such as calling an API

    // For demonstration purposes, we will simply set orderPlaced to true
    setState(() {
      orderPlaced = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              orderPlaced ? 'Order Placed!' : 'Proceed with Order?',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: orderPlaced ? null : placeOrder,
              child: Text(
                'Place Order',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OrderPage(),
  ));
}
