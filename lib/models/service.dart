import 'package:flutter/material.dart';

class Service {
  final IconData icon;
  final String title;
  final String description;
  final List<String> features;

  const Service({
    required this.icon,
    required this.title,
    required this.description,
    required this.features,
  });
}
