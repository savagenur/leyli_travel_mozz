import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';

class PrimaryColoredBox extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  const PrimaryColoredBox({
    super.key,
    this.backgroundColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DDimens.mediumPadding,
        vertical: DDimens.littlePadding,
      ) ,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.colors.primaryYellow,
        borderRadius: DDimens.smallRadius.radius,
      ),
      child: child,
    );
  }
}