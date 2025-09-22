import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  // ✅ Make position nullable
  Position? _currentPosition;
  Position? get currentPosition => _currentPosition;

  // ✅ Image logic
  File? _selectedImage;
  File? get selectImage => _selectedImage;

  void setImage(String path) {
    _selectedImage = File(path);
    notifyListeners();
  }

  // ✅ Change bottom nav index
  void changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  // ✅ Set location
  void setPosition(Position position) {
    _currentPosition = position;
    notifyListeners();
  }
}
