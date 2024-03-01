
import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          size: 15,
          color:
              index > 2 ? context.colors.gray60 : context.colors.primaryYellow,
        ),
      ),
    );
  }
}