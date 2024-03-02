import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/core/constants/constants.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';
import 'package:leyli_travel_mozz/core/widgets/appbar/adaptive_app_bar.dart';
import 'package:leyli_travel_mozz/core/widgets/colored_box/main_colored_box.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ConnectWithUsPage extends StatelessWidget {
  const ConnectWithUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(
        text: "Связаться с нами",
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitle(context, "Связаться с менеджером"),
                buildNumberTile(context),
                DDimens.bigPadding.verticalBox,
                buildTitle(context, "Наш офис"),
                buildLocationTile(context),
                DDimens.biggerPadding.verticalBox,
                buildAboutUs(context),
                DDimens.biggerPadding.verticalBox,
                buildLaunchWebSite(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildLaunchWebSite() {
    return ListTile(
      onTap: () {},
      leading: Icon(
        Icons.web_outlined,
      ),
      title: Text("Перейти на сайт"),
      trailing: Icon(
        Icons.arrow_right_alt_rounded,
      ),
    );
  }

  Padding buildAboutUs(BuildContext context) {
    return Padding(
      padding: DDimens.bigPadding.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(context, "Время работы", EdgeInsets.zero),
          Text(
            "Будни - с 10:30 до 18:00\nСуббота - с 10:30 до 18:00\nВоскресенье - Выходной",
          ),
          DDimens.biggerPadding.verticalBox,
          buildTitle(context, "О нас", EdgeInsets.zero),
          Text(
            """LEYLI TRAVEL - туроператор, турагентство которое предлагает широкий спектр возможностей для путешествий. Наша команда опытных специалистов стремится создать для вас идеальное путешествие учитывая все предпочтения и интересы. К нам туристы возвращаются вновь и вновь""",
          ),
        ],
      ),
    );
  }

  ListTile buildNumberTile(BuildContext context) {
    return ListTile(
      shape: OutlineInputBorder(
          borderRadius: DDimens.bigRadius.radius,
          borderSide: BorderSide(
            width: .5,
            color: context.colors.gray20,
          )),
      title: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "+7-707-113-64-00",
              style: TextStyle(
                color: context.colors.primaryBlue,
              ),
            ),
            const VerticalDivider(),
          ],
        ),
      ),
      trailing: Icon(
        Icons.phone_outlined,
        color: context.colors.primaryBlue,
      ),
    );
  }

  ListTile buildLocationTile(BuildContext context) {
    return ListTile(
      shape: OutlineInputBorder(
          borderRadius: DDimens.bigRadius.radius,
          borderSide: BorderSide(
            width: .5,
            color: context.colors.gray20,
          )),
      title: Text(
        "г. Тараз ул.Толе-Би 21",
        style: TextStyle(
          color: context.colors.primaryBlue,
        ),
      ),
      leading: Icon(
        Icons.location_on_outlined,
        color: context.colors.primaryBlue,
      ),
    );
  }

  Padding buildTitle(BuildContext context, String title,
      [EdgeInsets padding = const EdgeInsets.only(
        left: DDimens.bigPadding,
        bottom: DDimens.bigPadding,
      )]) {
    return Padding(
      padding: padding,
      child: Text(
        title,
        style: context.textTheme.titleMedium!.copyWith(
          fontFamily: semiBold,
        ),
      ),
    );
  }
}
