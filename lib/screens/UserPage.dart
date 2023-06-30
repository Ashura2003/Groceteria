import 'package:flutter/material.dart';

abstract class UserDetailsService {
  String getUsername();
  String getEmail();
}

class UserDetailsPage extends StatelessWidget {
  final UserDetailsService userDetailsService;

  UserDetailsPage({required this.userDetailsService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Username: ${userDetailsService.getUsername()}'),
            SizedBox(height: 10),
            Text('Email: ${userDetailsService.getEmail()}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.logout),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
