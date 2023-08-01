import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(title: 'Flutter Demo Home Page'),
  ));
}

class Rating {
  final double rating;
  final String review;

  Rating(this.rating, this.review);
}

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _rating = 0;
  String _review = '';

  void _submitRating() {
    // Create a Rating object with the current rating and review
    Rating rating = Rating(_rating, _review);

    // You can implement the logic to submit the rating object to the online platform here
    print('Rating: ${rating.rating}');
    print('Review: ${rating.review}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate and Review'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rate the item:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.star),
                  color: _rating >= 1 ? Colors.orange : Colors.grey,
                  onPressed: () {
                    setState(() {
                      _rating = 1;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.star),
                  color: _rating >= 2 ? Colors.orange : Colors.grey,
                  onPressed: () {
                    setState(() {
                      _rating = 2;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.star),
                  color: _rating >= 3 ? Colors.orange : Colors.grey,
                  onPressed: () {
                    setState(() {
                      _rating = 3;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.star),
                  color: _rating >= 4 ? Colors.orange : Colors.grey,
                  onPressed: () {
                    setState(() {
                      _rating = 4;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.star),
                  color: _rating >= 5 ? Colors.orange : Colors.grey,
                  onPressed: () {
                    setState(() {
                      _rating = 5;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Write a review...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _review = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitRating,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: "/Rating",
      routes: {
        "/Rating": (context) => RatingScreen(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
