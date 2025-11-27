import 'package:flutter/material.dart';

class JokeModel {
  final String title;
  final String description;
  bool isFavorite;

  JokeModel({
    required this.title,
    required this.description,
    this.isFavorite = false,
  });
}
