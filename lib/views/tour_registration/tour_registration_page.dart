import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/app/theme/app_text_theme/app_text_theme.dart';
import 'package:leyli_travel_mozz/core/constants/constants.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';
import 'package:leyli_travel_mozz/core/mocks/images.dart';
import 'package:leyli_travel_mozz/core/widgets/appbar/adaptive_app_bar.dart';
import 'package:leyli_travel_mozz/core/widgets/button/primary_button.dart';
import 'package:leyli_travel_mozz/core/widgets/colored_box/main_colored_box.dart';
import 'package:leyli_travel_mozz/core/widgets/flight_tile.dart';
import 'package:leyli_travel_mozz/core/widgets/input/text/primary_text_form_field.dart';
import 'package:leyli_travel_mozz/core/widgets/tour_card_title.dart';

class TourRegistrationPage extends StatelessWidget {
  const TourRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(
        text: "Оформление тура",
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
            buildHotel(),
            DDimens.biggerPadding.verticalBox,
            buildServices(context),
            DDimens.biggerPadding.verticalBox,
            buildFlight(context),
            DDimens.biggerPadding.verticalBox,
            buildDocs(context),
            DDimens.biggerPadding.verticalBox,
            buildSeat(context),
            DDimens.biggerPadding.verticalBox,
            buildNoteTextField(context),
            DDimens.doubleHugePadding.verticalBox,
            buildBookTourBtn(context),
            DDimens.doubleHugePadding.verticalBox,
            DDimens.doubleHugePadding.verticalBox,
          ],
        ),
      ),
    );
  }

  MainColoredBox buildHotel() {
    return MainColoredBox(
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

  Padding buildBookTourBtn(BuildContext context) {
    return Padding(
            padding: DDimens.largePadding.horizontal,
            child: Column(
              children: [
                Padding(
                  padding: DDimens.biggerPadding.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Итого"),
                      Text("-"),
                      Text(
                        "1 642 846 тнг.",
                        style: context.textTheme.titleLarge!.copyWith(
                          fontFamily: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                DDimens.bigPadding.verticalBox,
                PrimaryButton(
                  text: "Забронировать тур",
                  onTap: () {},
                )
              ],
            ),
          );
  }

  TextField buildNoteTextField(BuildContext context) {
    return TextField(
      onTapOutside: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      decoration: InputDecoration(
        labelText: "Примечания к заказу (необязательно)",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: "Введите текст",
      ),
    );
  }

  MainColoredBox buildSeat(BuildContext context) {
    return MainColoredBox(
      child: Column(
        children: [
          Padding(
            padding: DDimens.bigPadding.horizontal,
            child: Row(
              children: [
                Icon(
                  Icons.chair_outlined,
                  color: context.colors.gray20,
                ),
                DDimens.bigPadding.horizontalBox,
                Expanded(
                  child: Text(
                    "Места",
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: PrimaryButton(
                    text: "Выбрать",
                    textStyle: context.textTheme.bodySmall,
                    edgeInsets: DDimens.largePadding.horizontal,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: DDimens.bigPadding.horizontal,
              padding: DDimens.biggerPadding.all,
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.colors.gray60,
                borderRadius: DDimens.bigRadius.radius,
              ),
              child: Text(
                "Рядом (По возможности)",
                style: context.textTheme.titleMedium,
              ),
            ),
          ),
          DDimens.biggerPadding.verticalBox,
        ],
      ),
    );
  }

  MainColoredBox buildDocs(BuildContext context) {
    return MainColoredBox(
        child: Column(
      children: [
        DDimens.bigPadding.verticalBox,
        Padding(
          padding: DDimens.bigPadding.horizontal,
          child: Row(
            children: [
              Icon(
                Icons.document_scanner_outlined,
                color: context.colors.gray20,
              ),
              DDimens.bigPadding.horizontalBox,
              Text(
                "Документы туристов",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const Divider(),
        buildTouristDoc(context),
        DDimens.bigPadding.verticalBox,
        buildTouristDoc(context),
        DDimens.bigPadding.verticalBox,
      ],
    ));
  }

  Widget buildTouristDoc(BuildContext context) {
    return Padding(
      padding: DDimens.bigPadding.horizontal,
      
      child: Material(
        
        
        child: ListTile(
          tileColor: context.colors.gray60,
          onTap: () {},
          contentPadding: DDimens.bigPadding.horizontal,
          dense: true,
          visualDensity: const VisualDensity(vertical: -1.5),
          title: Text(
            "Пётр Жаринов",
            style: context.textTheme.bodyMedium!.copyWith(
              height: 0,
            ),
          ),
          subtitle: Text(
            "Взрослый",
            style: context.textTheme.bodySmall!.copyWith(
              color: context.colors.gray20,
              height: 0,
            ),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: context.colors.gray20,
          ),
        ),
      ),
    );
  }

  MainColoredBox buildFlight(BuildContext context) {
    return MainColoredBox(
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
              Text(
                "Перелет",
                textAlign: TextAlign.center,
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
    ));
  }

  MainColoredBox buildServices(BuildContext context) {
    return MainColoredBox(
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
          const Divider(),
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
}
