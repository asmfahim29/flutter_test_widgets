import 'package:flutter/material.dart';

class Item {
  final String title;
  final String subtitle;
  final IconData trailing;

  Item({
    required this.title,
    required this.subtitle,
    this.trailing = Icons.delete_outline_outlined,
  });
}