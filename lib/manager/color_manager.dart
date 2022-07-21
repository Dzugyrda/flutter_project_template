import 'dart:math';

import 'package:solid_test_task/model/rgb_color.dart';

/// class for colors management inside app
class ColorManager {
  static final ColorManager _instance = ColorManager._internal();

  /// max color value for generate
  static const maxColorVALUE = 255;
  final List<RGBColor> _colorsHistory = [];
  final Random _random = Random();

  /// factory constructor for reuse ColorManager in history_cubit
  factory ColorManager() {
    return _instance;
  }

  ColorManager._internal();

  /// function for generate random color and add that to colors history
  RGBColor generateRandomColor() {
    final red = _random.nextInt(maxColorVALUE);
    final green = _random.nextInt(maxColorVALUE);
    final blue = _random.nextInt(maxColorVALUE);
    final RGBColor _color = RGBColor(R: red, G: green, B: blue);
    _addColorToHistory(_color);

    return _color;
  }

  /// return colors list that was generated
  List<RGBColor> getColorsHistory() {
    return _colorsHistory;
  }

  void _addColorToHistory(RGBColor color) {
    _colorsHistory.insert(0, color);
  }
}
