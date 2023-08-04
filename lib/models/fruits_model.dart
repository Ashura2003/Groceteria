

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

FruitItemModel? placeModelFromJson(String str) => FruitItemModel.fromJson(json.decode(str));

String placeModelToJson(FruitItemModel? data) => json.encode(data!.toJson());

class FruitItemModel {
  FruitItemModel({
    this.fruitId,
    this.fruitName,
    this.description,
    this.price,
    this.imagepath,
  });
  String? fruitId;
  String? fruitName;
  String? description;
  String? price;
  String ?imagepath;


  factory FruitItemModel.fromJson(
      Map<String, dynamic> json) => FruitItemModel(
    fruitId: json["fruitId"],
    fruitName: json["fruitName"],
    description: json["description"],
    price: json["price"],
    imagepath: json["imagepath"],

  );

  Map<String, dynamic> toJson() => {
    "fruitId": fruitId,
    "fruitName": fruitName,
    "description": description,
    "price": price,
    "imagepath": imagepath,
  };
  factory FruitItemModel.fromFirebaseSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) => FruitItemModel(
    fruitId: json["fruitId"],
    fruitName: json["fruitName"],

    description: json["description"],
    price: json["price"],
    imagepath: json["imagepath"],
  );
}