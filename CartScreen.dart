import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CartScreenState();
  }
}

class CartScreenState extends State<CartScreen> {
  String textHolder = "1";
  String amountHolder = "200";
  String subtTotalHolder = "200";
  int totalItem = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            listviewHeading(),
            productListView(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                color: Color(0xfff1f1f1),
              ),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: [
                  subTotal(),
                  placeOrderButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Colors.teal,
      centerTitle: true,
      title: Text("Cart"),
    );
  }

  Widget listviewHeading() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 7),
      decoration: BoxDecoration(
        color: Color(0xffF1F1F1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Product Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
                color: Colors.black,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                "Quantity",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 50),
            child: Row(
              children: [
                Text(
                  "Amount",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget productListView() {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return productListViewItem(index);
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 0,
        );
      },
      itemCount: totalItem,
    );
  }

  Widget productListViewItem(int index) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Product Name",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff777b7a),
              ),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: SubclickFunction,
                child: Text("-"),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  textHolder,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff777b7a),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: AddclickFunction,
                child: Text("+"),
              ),
              Container(
                margin: EdgeInsets.only(left: 2),
                child: Text(
                  "Rs" + amountHolder,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff777b7a),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget subTotal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "SubTotal",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff777b7a),
          ),
        ),
        Text(
          subtTotalHolder,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff777b7a),
          ),
        ),
      ],
    );
  }

  Widget placeOrderButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 500),
      child: ElevatedButton(
        onPressed: placeOrder,
        child: Text("Place Order"),
      ),
    );
  }

  void AddclickFunction() {
    setState(() {
      num amt = num.parse(amountHolder);
      num quan = num.parse(textHolder);
      num subt = num.parse(subtTotalHolder);
      quan++;
      amt = amt + 200;
      subt = subt + 200;
      textHolder = quan.toString();
      amountHolder = amt.toString();
      subtTotalHolder = subt.toString();
    });
  }

  void SubclickFunction() {
    setState(() {
      num amt = num.parse(amountHolder);
      num quan = num.parse(textHolder);
      num subt = num.parse(subtTotalHolder);
      quan--;
      amt = amt - 200;
      subt = subt - 200;
      if (quan == 0) {
        totalItem--;
      }
      textHolder = quan.toString();
      amountHolder = amt.toString();
      subtTotalHolder = subt.toString();
    });
  }

  void placeOrder() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Order'),
          content: Text('Do you want to place this order?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                showOrderPlacedDialog();
              },
              child: Text('Place Order'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void showOrderPlacedDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Order Placed'),
          content: Text('Your order has been placed successfully.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
