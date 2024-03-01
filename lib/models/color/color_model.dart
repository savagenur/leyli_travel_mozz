import 'package:flutter/material.dart';

class ColorModel {
  final String title;
  final Color color;
  final bool isBorder;

  ColorModel({
    required this.title,
    required this.color,
     this.isBorder=false,
  });
}
