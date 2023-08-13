import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecommendationService {
  final String url;

  RecommendationService(this.url);

  Future<List<String>> getRecommendations(String userId) async {
    final http.Response response = await http.get(url as Uri, headers: {'userId': userId});

    if (response.statusCode == 200) {
      return json.decode(response.body)['items'];
    } else {
      return [];
    }
  }
}

void main() async {
  final recommendationService = RecommendationService('https://api.example.com/recommendations');
  final List<String> items = await recommendationService.getRecommendations('1234567890');

  final ListView listView = ListView.builder(
    itemCount: items.length,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Text(items[index]),
      );
    },
  );

  runApp(MaterialApp(home: listView));
}