import 'dart:math';

import 'package:solid_test_task/rgb_color.dart';

class ColorManager {
  static final ColorManager _instance = ColorManager._internal();
  static const MAX_COLOR_VALUE = 255;
  List<RGBColor> _colorsHistory = [];
  Random _random = Random();

  factory ColorManager() {
    return _instance;
  }

  ColorManager._internal();

  RGBColor generateRandomColor() {
    var red = _random.nextInt(MAX_COLOR_VALUE);
    var green = _random.nextInt(MAX_COLOR_VALUE);
    var blue = _random.nextInt(MAX_COLOR_VALUE);
    RGBColor _color = RGBColor(R: red, G: green, B: blue);
    _addColorToHistory(_color);
    return _color;
  }

  List<RGBColor> getColorsHistory() {
    return _colorsHistory;
  }

  void _addColorToHistory(RGBColor color) {
    _colorsHistory.insert(0, color);
  }
}
