import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/app/theme/app_text_theme/app_text_theme.dart';
import 'package:leyli_travel_mozz/core/constants/constants.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';
import 'package:leyli_travel_mozz/core/widgets/rating_stars.dart';

class TourCardTitle extends StatelessWidget {
  const TourCardTitle({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RatingStars(),
        DDimens.smallPadding.verticalBox,
        Text(
          "Rixos Bab Al Barh 5*",
          style: context.textTheme.titleMediumPlus!
              .copyWith(
                fontFamily: gilroyBold,
              ),
        ),
        Text(
          "Турция, Анталия",
          style: context.textTheme.bodyLarge!.copyWith(
            color: context.colors.gray20,
          ),
        ),
      ],
    );
  }
}