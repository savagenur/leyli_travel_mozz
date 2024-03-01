import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';

class MainColoredBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final bool isBorder;
  const MainColoredBox({
    super.key,
    this.padding,
    required this.child,
    this.isBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: DDimens.biggerRadius.radius,
        color: context.colors.gray80,
        border: isBorder
            ? Border.all(
                color: context.colors.gray60,
              )
            : null,
      ),
      child: child,
    );
  }
}