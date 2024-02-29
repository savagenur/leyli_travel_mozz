import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';

class PrimaryImageText extends StatelessWidget {
  final String assetName;
  final String text;
  const PrimaryImageText({
    super.key,
    required this.assetName,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(assetName),
        DDimens.bigPadding.verticalBox,
        Text(
          text,
          textAlign: TextAlign.center,
          style: context.textTheme.titleSmall!.copyWith(
            color: context.colors.primaryGreen,
          ),
        )
      ],
    );
  }
}