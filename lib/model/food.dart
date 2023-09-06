import 'package:flutter/material.dart';

class Food {
  String name;
  int count;
  int initialValue;
  Icon foodIcon;

  Food({
    required this.name,
    required this.count,
    required this.initialValue,
    required this.foodIcon,
  });
}
