import 'package:flutter/material.dart';

class Item
{
 int amount;
 String name;
 double price;
}

class Request {
  int id;
  String requester;
  String description;
  String item;
  bool done;

  Request({
    this.id,
    this.requester,
    this.description,
    this.item,
    this.done,
  });

  factory Request.fromMap(Map<String, dynamic> json) => new Request(
    id: json["id"],
    requester: json["requester"],
    description: json["description"],
    item: json["item"],
    done: json["done"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "requester": requester,
    "description": description,
    "item": item,
    "done": done,
  };
}