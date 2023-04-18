import 'package:flutter/material.dart';

class BottomBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  set selectedIndex(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }
}