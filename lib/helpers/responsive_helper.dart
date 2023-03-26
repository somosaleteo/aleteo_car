import 'dart:math';

import 'package:flutter/widgets.dart';

/// A class that allows you to scale the width of an element based on the
/// diagonal scale of the device screen size.
class Responsive {
  final double _diagonalSize;
  final double _scaleFactor;

  /// Creates a new [Responsive] object with the given diagonal size and scale
  /// factor.
  Responsive(this._diagonalSize, this._scaleFactor);

  /// Creates a new [Responsive] object based on the [MediaQuery] data provided
  /// by the [context] parameter and the [scaleFactor] provided as an argument.
  static Responsive of(BuildContext context, double scaleFactor) {
    final Size size = MediaQuery.of(context).size;
    final double diagonal =
        sqrt((size.width * size.width) + (size.height * size.height));

    return Responsive(diagonal, scaleFactor);
  }

  /// Returns the scaled width of an element based on a percentage of the
  /// diagonal size and the scaling factor.
  double wp(double width) {
    return (width / 100) * _diagonalSize * _scaleFactor;
  }

  double get diagonalSize => _diagonalSize;
}

double dp(BuildContext context, double val) {
  final size = MediaQuery.of(context).size;
  return dpFromSize(size, val);
}

double dpFromSize(Size size, double val, [limitedToWidth = false]) {
  double tmp = (size.width / size.height) * val;
  if (limitedToWidth) {
    tmp = tmp.clamp(0.0, size.width);
  }
  return tmp;
}

double diagonalValue(double width, double height) {
  return sqrt((width * width) + (height * height));
}

/// This function returns the given [percent] value of a [value] value.
///
/// Example usage:
/// ```dart
/// double result = dpPercent(500, 20);
/// // Result will be 100.0
/// ```
///
/// In the above example, the function 'dpPercent' is used to calculate 20% of 500
/// The resulting value of 100.0 is returned.
double dpPercent(double value, double percent) {
  return value * percent / 100;
}
