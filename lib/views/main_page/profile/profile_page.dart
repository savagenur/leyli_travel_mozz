import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/app/theme/app_text_theme/app_text_theme.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';
import 'package:leyli_travel_mozz/core/widgets/appbar/adaptive_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(
        text: "Профиль",
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: DDimens.largePadding.all,
        child: Column(
          children: [
            _buildProfileInfo(context),
            DDimens.largePadding.verticalBox,
            _buildAds(context),
            DDimens.largePadding.verticalBox,
            buildContactWithUs(),
            DDimens.largePadding.verticalBox,
            buildSignOut(),
          ],
        ),
      ),
    );
  }

  ListTile buildSignOut() {
    return ListTile(
      onTap: () {},
      leading: Icon(
        Icons.logout,
      ),
      title: Text("Выйти/Удалить аккаунт"),
    );
  }

  ListTile buildContactWithUs() {
    return ListTile(
      onTap: () {},
      leading: Icon(
        Icons.mail_outline_outlined,
      ),
      title: Text("Связаться с нами"),
      trailing: Icon(Icons.keyboard_arrow_right_rounded),
    );
  }

  Container _buildAds(BuildContext context) {
    return Container(
      padding: DDimens.biggerPadding.all,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF98FFA9),
          Color(0xFFB4FFE9),
        ]),
        borderRadius: DDimens.biggerRadius.radius,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Доступные бонусы",
                    style: TextStyle(
                      color: Color(0xFF40B0A3),
                    ),
                  ),
                  Text(
                    "25 172 тнг.",
                    style: context.textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: context.colors.primaryGreen,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.percent,
                color: context.colors.primaryGreen,
              )
            ],
          ),
          Text(
            "Получайте кэшбек за покупку туров и используйте бонусы для следующих поездок!",
            style: context.textTheme.bodySmall!.copyWith(
              color: context.colors.primaryGreen,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildProfileInfo(BuildContext context) {
    return Container(
      padding: DDimens.bigPadding.all,
      decoration: BoxDecoration(
        color: context.colors.gray80,
        borderRadius: DDimens.biggerRadius.radius,
      ),
      child: Row(
        children: [
          Container(
            padding: DDimens.hugePadding.all,
            decoration: BoxDecoration(
              color: context.colors.black,
              shape: BoxShape.circle,
            ),
            child: Text(
              "ПЖ",
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall!.copyWith(
                color: context.colors.gray60,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          DDimens.bigPadding.horizontalBox,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Пётр Жаринов",
                style: context.textTheme.titleMediumPlus,
              ),
              Text(
                "+7 708 800 40 40",
                style: context.textTheme.bodyMedium!
                    .copyWith(color: context.colors.gray20),
              ),
              Text(
                "dsdoklip@gmail.com",
                style: context.textTheme.bodyMedium!
                    .copyWith(color: context.colors.gray20),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
