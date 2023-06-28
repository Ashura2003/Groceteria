import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Groceteria/customs/custom_icons.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:velocity_x/velocity_x.dart';


class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String referenceId = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Changed background color here
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new)
              .iconColor(Colors.black),
          onPressed: () {
            Navigator.pushNamed(context, "/NewHomePage");
          },
        ),
      ),
      backgroundColor: Colors.black, // Changed background color here
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              const Text(
                "Payment",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.white,
                height: 20,
                thickness: 1,
              ),
              SizedBox(
                height: 20,
              ),

              //Image for Khalti
              InkWell(
                splashColor: Colors.grey,
                onTap: () {
                  print("Image Tapped");
                  khaltiWallet();
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/khaltilogo.png',
                      width: 180,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Khalti",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 40,
              ),

              //Cash on Delivery
              InkWell(
                splashColor: Colors.grey,
                onTap: () {
                  AlertDialog(
                    title: const Text("Cash on Delivery"),
                    content: const Text("Payment successful"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("OK"))
                    ],
                  );
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/cod.png',
                      width: 180,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Cash on delivery",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                splashColor: Colors.grey,
                onTap: () {
                  AlertDialog(
                    title: const Text("Visa Card"),
                    content: const Text("Payment successful"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("OK"))
                    ],
                  );
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/visa.png',
                      width: 180,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Visa Card",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Divider(
                color: Colors.white,
                height: 20,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  khaltiWallet() {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
          amount: 50*100,
          productIdentity: "1",
          productName: "tomato",
          mobile: "9804704028",
      ),
      preferences: [
        PaymentPreference.khalti,
        PaymentPreference.connectIPS

      ],
      onSuccess: onSuccess,
      onFailure: onFailure,
      onCancel: onCanceled,
    );
  }

  // mentod to handle success
  void onSuccess(PaymentSuccessModel success) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Success"),
            content: Text("Payment successful"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        });
  }

  // method to handle failure
  void onFailure(PaymentFailureModel failure) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Failure"),
            content: Text("Payment failed"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"))
            ],
          );
        });
  }

  // method to handle onCanceled

  void onCanceled() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Canceled"),
          content: Text("Payment canceled"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"))
          ],
        );
      },
    );
  }
}