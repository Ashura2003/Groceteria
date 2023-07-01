import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Customer {
  final String fullName;
  final String email;
  final int phoneNumber;

  Customer({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
  });
}

class CustomerDetailsScreen extends StatelessWidget {
  final DatabaseReference _customerRef =
  FirebaseDatabase.instance.reference().child('customers').child('customer1');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Details'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: FutureBuilder<DataSnapshot>(
              future: _customerRef.once().then((snapshot) => snapshot.snapshot),
              builder: (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  Map<dynamic, dynamic>? customerData = snapshot.data!.value as Map<dynamic, dynamic>?;

                  if (customerData == null) {
                    return Text('No data available');
                  }

                  Customer customer = Customer(
                    fullName: customerData['fullName'],
                    email: customerData['email'],
                    phoneNumber: customerData['phoneNumber'],
                  );

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text(
                          'Full Name',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          customer.fullName,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 16),
                      ListTile(
                        title: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          customer.email,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 16),
                      ListTile(
                        title: Text(
                          'Phone Number',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          customer.phoneNumber.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 32),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your logic here
                          },
                          child: Text('Edit Details'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Text('No data available');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}




