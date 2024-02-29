import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/app/theme/app_text_theme/app_text_theme.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';
import 'package:leyli_travel_mozz/core/widgets/button/primary_button.dart';

enum LikeType {
  like,
  dislike;
}

class TourDetailPage extends StatefulWidget {
  const TourDetailPage({super.key});

  @override
  State<TourDetailPage> createState() => TourDetailPageState();
}

class TourDetailPageState extends State<TourDetailPage> {
  int _currentImgIndex = 0;
  List<String> images = ["assets/bg_img.jpeg", "assets/bg2.png"];
  LikeType _likeType = LikeType.like;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildCarouselImg(),
            Padding(
              padding: DDimens.biggerPadding.all,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildStars(),
                  DDimens.smallPadding.verticalBox,
                  Text(
                    "Rixos Bab Al Barh 5*",
                    style: context.textTheme.titleMediumPlus!.copyWith(
                      fontFamily: "GilroyBold",
                    ),
                  ),
                  const Divider(),
                  buildDetail(),
                  const Divider(),
                  DDimens.mediumPadding.verticalBox,
                  Text(
                    "Туристам",
                    style: context.textTheme.titleMedium!.copyWith(
                      fontFamily: "GilroyBold",
                    ),
                  ),
                  DDimens.mediumPadding.verticalBox,
                  _buildTabBar(),
                  DDimens.bigPadding.verticalBox,
                  Wrap(
                    runSpacing: DDimens.bigPadding,
                    spacing: DDimens.bigPadding,
                    children: List.generate(
                      5,
                      (index) => buildCommentTitle(),
                    ),
                  ),
                  DDimens.bigPadding.verticalBox,
                  buildMoreComments(),
                  DDimens.hugePadding.verticalBox,
                  buildSuggestion(),
                  DDimens.hugePadding.verticalBox,
                  PrimaryButton(
                    margin: DDimens.hugePadding.horizontal,
                    text: "Подать заявку",
                    onTap: () {},
                  ),
                ],
              ),
            ),
            DDimens.doubleLargePadding.verticalBox,
          ],
        ),
      ),
    );
  }

  Padding buildSuggestion() {
    return Padding(
      padding: DDimens.bigPadding.horizontal,
      child: Column(
        children: [
          buildSuggestionTitle(),
          DDimens.mediumPadding.verticalBox,
          Text(
            "Семейный отель, работающий на ультра все включено: алкоголь входит. Ежедневно проводятся шоу-программы.",
            style: context.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Row buildSuggestionTitle() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: context.colors.primaryGreen,
          radius: 30,
          child: SvgPicture.asset(
            "assets/svg/Union.svg",
          ),
        ),
        DDimens.bigPadding.horizontalBox,
        Text(
          "LEYELI\nРекомендует",
          style: TextStyle(
            fontFamily: "GilroyBold",
          ),
        ),
      ],
    );
  }

  Container buildCommentTitle() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: DDimens.bigPadding,
        horizontal: DDimens.hugePadding,
      ),
      decoration: BoxDecoration(
        color: context.colors.gray80,
        borderRadius: DDimens.bigRadius.radius,
      ),
      child: Column(
        children: [
          Text(
            "Питание",
            style: context.textTheme.bodySmall!.copyWith(
              fontFamily: "GilroyBold",
            ),
          ),
          Text(
            "209",
            style: context.textTheme.bodySmall!
                .copyWith(color: context.colors.gray20),
          ),
        ],
      ),
    );
  }

  Widget buildMoreComments() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: DDimens.biggerPadding,
        horizontal: DDimens.hugePadding,
      ),
      decoration: BoxDecoration(
        color: context.colors.gray60,
        borderRadius: DDimens.bigRadius.radius,
      ),
      child: Column(
        children: [
          Text(
            "+ ещё 10",
            style: context.textTheme.bodySmall!.copyWith(
              fontFamily: "GilroyBold",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: DDimens.detailTourTabBarHeight,
      padding: DDimens.smallPadding.all,
      decoration: BoxDecoration(
        borderRadius: DDimens.bigRadius.radius,
        color: context.colors.gray60,
      ),
      child: Row(
        children: [
          _buildTab(
            title: "Нравится",
            onTap: () {
              setState(() {
                _likeType = LikeType.like;
              });
            },
            isSelected: _likeType == LikeType.like,
          ),
          _buildTab(
            title: "Не нравится",
            onTap: () {
              setState(() {
                _likeType = LikeType.dislike;
              });
            },
            isSelected: _likeType == LikeType.dislike,
          ),
        ],
      ),
    );
  }

  Expanded _buildTab(
      {required String title,
      required VoidCallback onTap,
      required bool isSelected}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: DDimens.bigRadius.radius,
            color: isSelected ? context.colors.white : Colors.transparent,
          ),
          child: Text(
            title,
            style: context.textTheme.titleSmall!.copyWith(
              fontFamily: "GilroyBold",
              color: isSelected ? context.colors.black : context.colors.gray20,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetail() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Турция, Анталия",
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: context.colors.gray20,
                    fontFamily: "GilroyBold",
                  ),
                ),
                DDimens.smallPadding.verticalBox,
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: context.colors.primaryBlue,
                    ),
                    Text(
                      "На карте",
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: context.colors.primaryBlue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: Colors.black,
            width: DDimens.bigPadding,
            thickness: .5,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Booking.com",
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleMediumPlus!.copyWith(
                      fontFamily: "GilroyBold",
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DDimens.biggerPadding,
                      vertical: DDimens.smallPadding,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: DDimens.largeRadius.radius,
                      color: context.colors.primaryBlue,
                    ),
                    child: Text(
                      "4.6",
                      style: TextStyle(
                        color: context.colors.white,
                        fontFamily: "GilroyBold",
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildStars() {
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
            height: 285,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImgIndex = index;
              });
            },
          ),
        ),
        Positioned(
          left: DDimens.largePadding,
          top: 0,
          child: SafeArea(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios,
                color: context.colors.white,
              ),
            ),
          ),
        ),
        buildIndicator(),
      ],
    );
  }

  Positioned buildIndicator() {
    return Positioned(
      bottom: DDimens.bigPadding,
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
