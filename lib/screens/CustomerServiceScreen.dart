import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerServiceScreen extends StatefulWidget {
  const CustomerServiceScreen({Key? key}) : super(key: key);

  @override
  State<CustomerServiceScreen> createState() => _CustomerServiceScreenState();
}

class _CustomerServiceScreenState extends State<CustomerServiceScreen> {
  String userFeedback = '';

  void submitFeedback() {
    // Implement your logic to handle the user feedback submission
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Feedback Submitted'),
          content: Text('Thank you for your feedback!'),
          actions: [
            TextButton(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  'Address: Dillibazar, Kathmandu, Nepal',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'User Feedback:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  userFeedback = value;
                });
              },
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Enter your feedback...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: submitFeedback,
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
