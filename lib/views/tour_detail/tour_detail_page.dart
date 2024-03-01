import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/app/theme/app_text_theme/app_text_theme.dart';
import 'package:leyli_travel_mozz/core/constants/constants.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';
import 'package:leyli_travel_mozz/core/mocks/images.dart';
import 'package:leyli_travel_mozz/core/widgets/appbar/adaptive_app_bar.dart';
import 'package:leyli_travel_mozz/core/widgets/button/primary_button.dart';
import 'package:leyli_travel_mozz/core/widgets/flight_tile.dart';
import 'package:leyli_travel_mozz/core/widgets/colored_box/main_colored_box.dart';
import 'package:leyli_travel_mozz/core/widgets/colored_box/small_colored_box.dart';
import 'package:leyli_travel_mozz/core/widgets/rating_stars.dart';
import 'package:leyli_travel_mozz/core/widgets/tour_card_title.dart';

class TourDetailPage extends StatelessWidget {
  const TourDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(
        text: "Rixos Bab Al Barh 5*",
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message_outlined,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: DDimens.biggerPadding.all,
        child: Column(
          children: [
            buildHotel(context),
            DDimens.biggerPadding.verticalBox,
            buildPassengerDate(context),
            DDimens.biggerPadding.verticalBox,
            buildPriceCard(context),
            DDimens.biggerPadding.verticalBox,
            buildChooseRoom(context),
            DDimens.biggerPadding.verticalBox,
            buildServices(context),
            DDimens.biggerPadding.verticalBox,
            buildFlight(context),
            DDimens.hugePadding.verticalBox,
            PrimaryButton(
              margin: DDimens.largePadding.horizontal,
              text: "Формить тур (1 642 846 тнг.)",
              onTap: () {},
            ),
            DDimens.doubleHugePadding.verticalBox,
          ],
        ),
      ),
    );
  }

  Widget buildHotel(BuildContext context) {
    return buildColoredBox(
      context,
      isBorder: false,
      padding: DDimens.bigPadding.all,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 45,
            foregroundImage: AssetImage(
              kImages[0],
            ),
          ),
          DDimens.bigPadding.horizontalBox,
          TourCardTitle(),
        ],
      ),
    );
  }

  Widget buildPassengerDate(BuildContext context) {
    return buildColoredBox(
      context,
      child: Column(
        children: [
          DDimens.bigPadding.verticalBox,
          buildListItem(
            context,
            iconData: Icons.people_outline,
            title: "Люди",
            subtitle: "2 взрослых",
          ),
          const Divider(),
          buildListItem(
            context,
            iconData: Icons.calendar_month_outlined,
            title: "Сроки",
            subtitle: "с 19 янв. по 26 янв., 7 ночей",
          ),
          DDimens.bigPadding.verticalBox,
        ],
      ),
    );
  }

  Widget buildFlight(BuildContext context) {
    return buildColoredBox(
      context,
      child: Column(
        children: [
          DDimens.bigPadding.verticalBox,
          Padding(
            padding: DDimens.bigPadding.horizontal,
            child: Row(
              children: [
                Icon(
                  Icons.airplanemode_active_outlined,
                  color: context.colors.gray20,
                ),
                DDimens.bigPadding.horizontalBox,
                Expanded(
                  child: Text(
                    "Перелет",
                    textAlign: TextAlign.center,
                  ),
                ),
                PrimaryButton(
                  text: "Выбрать рейс",
                  textStyle: context.textTheme.bodySmall,
                  edgeInsets: DDimens.biggerPadding.horizontal,
                  onTap: () {},
                ),
              ],
            ),
          ),
          const Divider(),
          FlightTile(
              companyName: "Aurora",
              companyImage: kImages[0],
              baggage: 20,
              handBaggage: 8,
              leftTownCode: "ALA",
              leftTownName: "Almaty",
              leftTime: TimeOfDay(hour: 6, minute: 15),
              leftDate: DateTime(2024, 1, 19),
              rightTownCode: "AYT",
              rightTownName: "Antalya",
              rightTime: TimeOfDay(hour: 10, minute: 15),
              rightDate: DateTime(2024, 1, 19),
              durationTime: "5 ч 10 мин"),
          FlightTile(
              reverse: true,
              companyName: "Aurora",
              companyImage: kImages[0],
              baggage: 20,
              handBaggage: 8,
              leftTownCode: "ALA",
              leftTownName: "Almaty",
              leftTime: TimeOfDay(hour: 9, minute: 15),
              leftDate: DateTime(2024, 1, 19),
              rightTownCode: "AYT",
              rightTownName: "Antalya",
              rightTime: TimeOfDay(hour: 6, minute: 15),
              rightDate: DateTime(2024, 1, 19),
              durationTime: "5 ч 10 мин"),
        ],
      ),
    );
  }

  Widget buildChooseRoom(BuildContext context) {
    return buildColoredBox(
      context,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: buildListItem(context,
                    iconData: Icons.bed_outlined,
                    title: "Номер",
                    subtitle: "Deluxe Room with Ga Deluxe Room with Ga..."),
              ),
              DDimens.smallPadding.horizontalBox,
              PrimaryButton(
                text: "Выбрать другой",
                textStyle: context.textTheme.bodySmall,
                edgeInsets: DDimens.biggerPadding.horizontal,
                onTap: () {},
              )
            ],
          ),
          DDimens.mediumPadding.verticalBox,
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(DDimens.biggerRadius),
              bottomRight: Radius.circular(
                DDimens.biggerRadius,
              ),
            ),
            child: SizedBox(
              height: 140,
              width: double.infinity,
              child: Image.asset(
                kImages[0],
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildServices(BuildContext context) {
    return buildColoredBox(
      context,
      child: Column(
        children: [
          DDimens.bigPadding.verticalBox,
          buildListItem(
            context,
            iconData: Icons.food_bank_outlined,
            title: "Питание",
            subtitle: "Ультра всё включено",
          ),
          const Divider(),
          buildListItem(
            context,
            iconData: Icons.directions_bus_outlined,
            title: "Групповой трансфер",
            subtitle: "Аэропорт - Отель - Аэропорт",
          ),
          const Divider(),
          buildListItem(
            context,
            iconData: Icons.shield_outlined,
            title: "Медицинская страховка",
            subtitle: "Без экстремальных видов спорта",
          ),
          const Divider(),
          buildListItem(
            context,
            iconData: Icons.person_pin_outlined,
            title: "Сопровождение менеджера",
            subtitle: "Круглосуточная помощь в мессенджерах",
          ),
          DDimens.bigPadding.verticalBox,
        ],
      ),
    );
  }

  Widget buildPriceCard(BuildContext context) {
    return buildColoredBox(
      context,
      child: Column(
        children: [
          Padding(
            padding: DDimens.bigPadding.all,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      "1 895 061 ₸",
                      style: context.textTheme.titleLarge!.copyWith(
                        fontFamily: semiBold,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DDimens.smallPadding.verticalBox,
                    SmallColoredBox(
                      child: Text.rich(
                        TextSpan(text: "70 045 ₸ ", children: [
                          TextSpan(
                              text: "x24 мес",
                              style: context.textTheme.bodySmall!.copyWith(
                                color: context.colors.white,
                              ))
                        ]),
                        style: context.textTheme.titleSmall!.copyWith(
                          color: context.colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SmallColoredBox(
                  backgroundColor: context.colors.primaryRed,
                  child: Text(
                    "-18%",
                    style: context.textTheme.titleSmall!.copyWith(
                      fontFamily: semiBold,
                      color: context.colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          buildCashBack(context)
        ],
      ),
    );
  }

  Container buildCashBack(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF98FFA9),
              Color(0xFFB4FFE9),
            ],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(DDimens.biggerRadius),
            bottomRight: Radius.circular(DDimens.biggerRadius),
          )),
      child: ListTile(
        title: Text(
          "27 911 тнг.",
          style: context.textTheme.titleMediumPlus!.copyWith(
            fontFamily: semiBold,
            fontWeight: FontWeight.bold,
            color: context.colors.primaryGreen,
          ),
        ),
        subtitle: Text(
          "Кэшбэк на бонусный счёт",
          style: TextStyle(
            color: context.colors.secondaryGreen,
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: context.colors.primaryGreen,
        ),
      ),
    );
  }

  Widget buildListItem(
    BuildContext context, {
    required IconData iconData,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: DDimens.bigPadding.horizontal,
      child: Row(
        children: [
          Icon(
            iconData,
            color: context.colors.gray20,
          ),
          DDimens.bigPadding.horizontalBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodySmall!.copyWith(
                    color: context.colors.gray20,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildColoredBox(BuildContext context,
      {EdgeInsets? padding, required Widget child, bool isBorder = true}) {
    return MainColoredBox(
      padding: padding,
      isBorder: isBorder,
      child: child,
    );
  }
}
