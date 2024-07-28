import 'package:flutter/material.dart';

extension BuildContextExtenstion on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  NavigatorState get navigator => Navigator.of(this);
}
