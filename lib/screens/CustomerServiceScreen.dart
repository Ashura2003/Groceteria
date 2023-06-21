import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerServiceScreen extends StatefulWidget {
  const CustomerServiceScreen({Key? key}) : super(key: key);

  @override
  State<CustomerServiceScreen> createState() => _CustomerServiceScreenState();
}

class _CustomerServiceScreenState extends State<CustomerServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Customer Service'),
      backgroundColor: Colors.teal,
    ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'For any inquiries or assistance, please reach out to our customer service team:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.phone, size: 20.0),
                SizedBox(width: 8.0),
                Text(
                  'Phone: +977-9841243723',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.mail, size: 20.0),
                SizedBox(width: 8.0),
                Text(
                  'Email: support@example.com',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.location_on, size: 20.0),
                SizedBox(width: 8.0),
                Text(
                  'Address: Dillibazar,Kathmandu, Nepal',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
