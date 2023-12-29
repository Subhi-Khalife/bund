import 'package:flutter/material.dart';

class BottomNavigationBarListItem {
  BottomNavigationBarListItem({
    required this.imagePath,
    required this.isActive,
    required this.screen,
    required this.title,
    required this.currentIndex,
  });
  Widget screen;
  String imagePath;
  bool isActive;
  String title;
  int currentIndex;
}
