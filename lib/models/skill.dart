import 'package:flutter/material.dart';

class Skill {
  final String name;
  final String category;
  final IconData? icon;

  const Skill({
    required this.name,
    required this.category,
    this.icon,
  });
}

class SkillCategory {
  final String name;
  final List<Skill> skills;

  const SkillCategory({
    required this.name,
    required this.skills,
  });
}
