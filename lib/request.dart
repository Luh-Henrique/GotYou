import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Request {
  int id;
  String requester;
  String description;
  String item;
  bool done;
  String location;

  Request({
    this.id,
    this.requester,
    this.description,
    this.item,
    this.done,
    this.location
  });

  factory Request.fromMap(Map<String, dynamic> json) => new Request(
    id: json["id"],
    requester: json["requester"],
    description: json["description"],
    item: json["item"],
    done: json["done"],
    location: json["location"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "requester": requester,
    "description": description,
    "item": item,
    "done": done,
    "location": location,
  };
}