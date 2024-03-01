import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';
import 'package:leyli_travel_mozz/models/color/color_model.dart';

List<ColorModel> getSeatColors(BuildContext context) => [
      ColorModel(
        title: "Свободно",
        color: context.colors.white,
        isBorder: true,
      ),
      ColorModel(
        title: "Выбрано",
        color: context.colors.primaryBlue,
      ),
      ColorModel(
        title: "Занято",
        color: context.colors.primaryGreen,
      ),
      ColorModel(
        title: "Платные места",
        color: context.colors.primaryYellow,
      ),
    ];
