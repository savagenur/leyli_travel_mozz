import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/app/colors/app_colors.dart';

class AppColorsLight implements AppColors {
  @override
  Color get black => Colors.black;
  @override
  Color get white => Colors.white;

  @override
  Color get black40 => Colors.black38;

  @override
  Color get grey => Colors.grey;

  @override
  Color get gray10 => Colors.grey.shade900;

  @override
  Color get gray20 => Colors.grey.shade800;

  @override
  Color get gray40 => Colors.grey.shade600;

  @override
  Color get gray60 => Colors.grey.shade400;

  @override
  Color get gray80 => Colors.grey.shade200;

  @override
  Color get primaryBlue => Colors.blue;

  @override
  Color get primaryGreen => Color(0xFF126B60);

  @override
  Color get primaryRed => Colors.red;

  @override
  Color get primaryYellow => Colors.yellow;

  @override
  Color get secondaryGreen => Color(0xFF40B0A3);

  @override
  Color get tertiaryGreen => Color(0xFF);

  @override
  Color get tertiaryRed => Color(0xFF);
}
