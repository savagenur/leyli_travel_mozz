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
  Color get scaffoldBackground => Colors.white;

  @override
  Color get grey => Colors.grey;

  @override
  Color get gray10 => Colors.grey.shade900;

  @override
  Color get gray20 => Color(0xFF4C6D86);

  @override
  Color get gradationGrey => Color(0xFF4C6D86);

  @override
  Color get gray40 => Colors.grey.shade600;

  @override
  Color get gray60 => Color(0xFFE0E9F3);

  @override
  Color get gray80 => Color(0xFFF2F6F9);

  @override
  Color get primaryBlue => Color(0xFF326BD8);

  @override
  Color get primaryGreen => Color(0xFF126B60);

  @override
  Color get primaryRed => Color(0xFFFF001F);

  @override
  Color get primaryYellow => Color(0xFFFFC531);

  @override
  Color get secondaryGreen => Color(0xFF40B0A3);

  @override
  Color get tertiaryGreen => Color(0xFF);

  @override
  Color get tertiaryRed => Color(0xFF);
}
