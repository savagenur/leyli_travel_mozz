import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color borderColor;
  final double borderWidth;
  final EdgeInsetsGeometry? edgeInsets;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final double elevation;
  final Widget? icon;
  final MainAxisAlignment mainAxisAlignment;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.foregroundColor,
    this.height,
    this.textStyle,
    this.edgeInsets,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.borderColor = const Color(0xFFFFFFFF),
    this.borderWidth = 0,
    this.elevation = 1,
    this.icon,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          
          style: ElevatedButton.styleFrom(
            
            elevation: elevation,
            padding: edgeInsets??DDimens.biggerPadding.vertical,
            foregroundColor:foregroundColor?? context.colors.white,
            textStyle:textStyle?? context.textTheme.titleMedium,
            backgroundColor:
                backgroundColor ?? context.colors.primaryGreen,
            shape: RoundedRectangleBorder(
              borderRadius:
                  borderRadius ?? BorderRadius.circular(DDimens.bigRadius),
              side: BorderSide(color: borderColor, width: borderWidth),
            ),
          ),
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              icon ?? SizedBox(),
              Text(
                text,
               
              ),
            ],
          ),
        ),
      ),
    );
  }
}
