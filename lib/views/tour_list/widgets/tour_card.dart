import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/app/theme/app_text_theme/app_text_theme.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';
import 'package:leyli_travel_mozz/core/widgets/tour_card_title.dart';

class TourCard extends StatefulWidget {
  const TourCard({super.key});

  @override
  State<TourCard> createState() => _TourCardState();
}

class _TourCardState extends State<TourCard> {
  int _currentImgIndex = 0;
  List<String> images = ["assets/bg_img.jpeg", "assets/bg2.png"];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: DDimens.hugePadding.bottom,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: DDimens.biggerRadius.radius,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(DDimens.biggerRadius),
            topLeft: Radius.circular(DDimens.biggerRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCarouselImg(),
              DDimens.bigPadding.verticalBox,
              buildTitle(),
              const Divider(),
              buildFooter(),
              DDimens.biggerPadding.verticalBox,
            ],
          ),
        ),
      ),
    );
  }

  Padding buildFooter() {
    return Padding(
      padding: DDimens.biggerPadding.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Цена за\n2 взрослых",
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "1 895 061 ₸",
                style: context.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Перелёт включен",
                style: context.textTheme.bodySmallMinus,
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: DDimens.biggerPadding.horizontal,
      child: TourCardTitle(),
    );
  }

  Widget buildCarouselImg() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          items: images
              .map((e) => Image.asset(
                    e,
                    fit: BoxFit.cover,
                  ))
              .toList(),
          options: CarouselOptions(
            height: 257,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImgIndex = index;
              });
            },
          ),
        ),
        buildIndicator()
      ],
    );
  }

  Positioned buildIndicator() {
    return Positioned(
      top: DDimens.bigPadding,
      child: Container(
        padding: DDimens.smallPadding.all,
        decoration: BoxDecoration(
            color: context.colors.black.withOpacity(.4),
            borderRadius: DDimens.mediumRadius.radius),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.map((image) {
            final isCurrent = _currentImgIndex == images.indexOf(image);
            return Container(
              width: isCurrent ? 8.0 : 6,
              height: isCurrent ? 8.0 : 6,
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.black
                          : Colors.white)
                      .withOpacity(isCurrent ? 0.9 : 0.4)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
