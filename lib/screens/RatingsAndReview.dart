/*
import 'package:flutter/material.dart';

void main() {
  runApp(RatingsAndReview());
}

class RatingsAndReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ratings & Reviews App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RatingsAndReviewScreen(),
    );
  }
}

class Review {
  final String userName;
  final int rating;
  final String comment;

  Review({required this.userName, required this.rating, required this.comment});
}

class RatingsAndReviewScreen extends StatefulWidget {
  @override
  _RatingsAndReviewScreenState createState() => _RatingsAndReviewScreenState();
}

class _RatingsAndReviewScreenState extends State<RatingsAndReviewScreen> {
  List<Review> reviews = [];

  void addReview(String userName, int rating, String comment) {
    setState(() {
      reviews.add(Review(userName: userName, rating: rating, comment: comment));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ratings & Reviews'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                Review review = reviews[index];
                return ListTile(
                  title: Text('${review.userName} - Rating: ${review.rating}'),
                  subtitle: Text(review.comment),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReviewForm(addReview),
          ),
        ],
      ),
    );
  }
}

class ReviewForm extends StatefulWidget {
  final Function(String, int, String) onAddReview;

  ReviewForm(this.onAddReview);

  @override
  _ReviewFormState createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  String userName = '';
  int rating = 1;
  String comment = '';

  void submitReview() {
    if (userName.isNotEmpty && comment.isNotEmpty) {
      widget.onAddReview(userName, rating, comment);
      setState(() {
        userName = '';
        rating = 1;
        comment = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Your Name'),
          onChanged: (value) => setState(() => userName = value),
        ),
        Row(
          children: [
            Text('Rating:'),
            SizedBox(width: 10),
            DropdownButton<int>(
              value: rating,
              onChanged: (value) => setState(() => rating = value!),
              items: [1, 2, 3, 4, 5]
                  .map((value) => DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString()),
              ))
                  .toList(),
            ),
          ],
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Review'),
          onChanged: (value) => setState(() => comment = value),
        ),
        ElevatedButton(
          onPressed: submitReview,
          child: Text('Submit Review'),
        ),
      ],
    );
  }
}
*/
