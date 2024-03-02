import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/app/theme/app_text_theme/app_text_theme.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';
import 'package:leyli_travel_mozz/core/utils/utils.dart';
import 'package:leyli_travel_mozz/core/widgets/appbar/adaptive_app_bar.dart';
import 'package:leyli_travel_mozz/core/widgets/button/primary_button.dart';
import 'package:leyli_travel_mozz/core/widgets/colored_box/main_colored_box.dart';
import 'package:leyli_travel_mozz/views/choose_seat/widgets/bus_seats.dart';

@RoutePage()
class ChooseSeatPage extends StatefulWidget {
  const ChooseSeatPage({super.key});

  @override
  State<ChooseSeatPage> createState() => ChooseSeatPageState();
}

class ChooseSeatPageState extends State<ChooseSeatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(
        text: "Выбор места",
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
            buildPassenger(),
            DDimens.biggerPadding.verticalBox,
            buildColors(),
            DDimens.hugePadding.verticalBox,
            buildSeatList(),
            DDimens.biggerPadding.verticalBox,
            DDimens.doubleHugePadding.verticalBox,
            buildDoneBtn(),
            DDimens.doubleHugePadding.verticalBox,

          ],
        ),
      ),
    );
  }

  MainColoredBox buildColors() {
    return MainColoredBox(
      isBorder: false,
      padding: DDimens.bigPadding.all,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: getSeatColors(context)
            .map(
              (e) => buildColorItem(
                context,
                title: e.title,
                color: e.color,
                isBorder: e.isBorder,
              ),
            )
            .toList(),
      ),
    );
  }

  Column buildColorItem(
    BuildContext context, {
    required String title,
    required Color color,
    bool isBorder = false,
  }) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: isBorder
                ? Border.all(
                    width: 2,
                    color: context.colors.gray20,
                  )
                : null,
          ),
        ),
        DDimens.smallPadding.verticalBox,
        Text(
          title,
          style: context.textTheme.bodySmallMinus,
        ),
      ],
    );
  }

  MainColoredBox buildPassenger() {
    return MainColoredBox(
      isBorder: false,
      padding: DDimens.smallPadding.vertical,
      child: Column(
        children: [
          buildListTile(),
          buildListTile(),
        ],
      ),
    );
  }

  ListTile buildListTile() {
    return ListTile(
      contentPadding: DDimens.bigPadding.horizontal,
      dense: true,
      visualDensity: const VisualDensity(vertical: -1.5),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Пётр Жаринов",
            style: context.textTheme.bodyMedium!.copyWith(
              height: 0,
            ),
          ),
          Text(
            "Взрослый",
            style: context.textTheme.bodySmall!.copyWith(
              color: context.colors.gray20,
              height: 0,
            ),
          )
        ],
      ),
      trailing: Padding(
        padding: DDimens.largePadding.right,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "C11",
              style: context.textTheme.bodyMedium!.copyWith(
                height: 0,
              ),
            ),
            Text(
              "Место",
              style: context.textTheme.bodySmall!.copyWith(
                color: context.colors.gray20,
                height: 0,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSeatList() {
    return const BusSeats();
  }

  Widget buildDoneBtn() {
    return PrimaryButton(
      text: "Готово",
      onTap: () {
                context.popRoute();

      },
    );
  }
}
