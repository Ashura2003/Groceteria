import 'package:flutter/material.dart';
import 'dart:math';

class UserDetails {
  final String name;
  final int age;
  final String email;

  UserDetails({
    required this.name,
    required this.age,
    required this.email,
  });
}

class UserList extends StatelessWidget {
  final List<UserDetails> userDetailsList = [
    UserDetails(
      name: 'John Doe',
      age: 25,
      email: 'johndoe@example.com',
    ),
    UserDetails(
      name: 'Jane Smith',
      age: 30,
      email: 'janesmith@example.com',
    ),
    UserDetails(
      name: 'Mike Johnson',
      age: 28,
      email: 'mikejohnson@example.com',
    ),
    UserDetails(
      name: 'Emily Davis',
      age: 32,
      email: 'emilydavis@example.com',
    ),
    UserDetails(
      name: 'Alex Brown',
      age: 27,
      email: 'alexbrown@example.com',
    ),
    UserDetails(
      name: 'Sarah Wilson',
      age: 35,
      email: 'sarahwilson@example.com',
    ),
    UserDetails(
      name: 'David Lee',
      age: 31,
      email: 'davidlee@example.com',
    ),
    UserDetails(
      name: 'Jennifer Taylor',
      age: 29,
      email: 'jennifertaylor@example.com',
    ),
    UserDetails(
      name: 'Robert Clark',
      age: 33,
      email: 'robertclark@example.com',
    ),
    UserDetails(
      name: 'Amy Turner',
      age: 26,
      email: 'amyturner@example.com',
    ),
    UserDetails(
      name: 'Michael Adams',
      age: 34,
      email: 'michaeladams@example.com',
    ),
    UserDetails(
      name: 'Jessica Hall',
      age: 28,
      email: 'jessicahall@example.com',
    ),
    UserDetails(
      name: 'Daniel Nelson',
      age: 31,
      email: 'danielnelson@example.com',
    ),
    UserDetails(
      name: 'Laura Miller',
      age: 29,
      email: 'lauramiller@example.com',
    ),
    UserDetails(
      name: 'William Turner',
      age: 35,
      email: 'williamturner@example.com',
    ),
    UserDetails(
      name: 'Olivia Brown',
      age: 27,
      email: 'oliviabrown@example.com',
    ),
    UserDetails(
      name: 'Christopher Davis',
      age: 32,
      email: 'christopherdavis@example.com',
    ),
    UserDetails(
      name: 'Sophia Johnson',
      age: 30,
      email: 'sophiajohnson@example.com',
    ),
    UserDetails(
      name: 'Matthew Smith',
      age: 26,
      email: 'matthewsmith@example.com',
    ),
    UserDetails(
      name: 'Ava Wilson',
      age: 33,
      email: 'avawilson@example.com',
    ),
  ];

  List<UserDetails> getRandomUserDetails(int count) {
    List<UserDetails> randomUserDetails = [];
    Random random = Random();

    while (randomUserDetails.length < count && randomUserDetails.length < userDetailsList.length) {
      int index = random.nextInt(userDetailsList.length);
      if (!randomUserDetails.contains(userDetailsList[index])) {
        randomUserDetails.add(userDetailsList[index]);
      }
    }

    return randomUserDetails;
  }

  @override
  Widget build(BuildContext context) {
    List<UserDetails> randomUserDetails = getRandomUserDetails(userDetailsList.length);

    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Container(
            // height: 230,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.only(
            //     bottomRight: Radius.circular(50),
            //   ),
            //   color: Color(0xFF363f93),
            // ),
            // child: Stack(
            //   children: [
            //     Positioned(
            //       top: 80,
            //       left: 0,
            //       child: Container(
            //         height: 100,
            //         width: 300,
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.only(
            //             topRight: Radius.circular(50),
            //             bottomRight: Radius.circular(50),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'User Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: randomUserDetails.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${randomUserDetails[index].name}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Age: ${randomUserDetails[index].age}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Email: ${randomUserDetails[index].email}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
