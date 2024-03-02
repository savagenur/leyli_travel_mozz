import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/app/theme/app_text_theme/app_text_theme.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';
import 'package:leyli_travel_mozz/core/widgets/appbar/adaptive_app_bar.dart';
import 'package:leyli_travel_mozz/core/widgets/colored_box/small_colored_box.dart';
import 'package:leyli_travel_mozz/core/widgets/primary_image_text.dart';

@RoutePage()
class MyTourPage extends StatelessWidget {
  const MyTourPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(
        text: "Мой тур",
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message_outlined,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return _buildTourItem(context);
        },
      ),
    );
  }

  Widget _buildTourItem(BuildContext context) {
    return Padding(
      padding: DDimens.largePadding.all,
      child: Material(
        elevation: 1.5,
        borderRadius: DDimens.biggerRadius.radius,
        color: context.colors.white,
        child: Column(
          children: [
            Padding(
              padding: DDimens.biggerPadding.all,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallColoredBox(
                    backgroundColor: context.colors.primaryRed,
                    child: Text(
                      "-18%",
                      style: context.textTheme.titleSmall!.copyWith(
                        color: context.colors.white,
                      ),
                    ),
                  ),
                  DDimens.smallPadding.verticalBox,
                  _buildIconText(
                    context,
                    iconData: Icons.calendar_month_outlined,
                    text: "22 янв - 29 явн, 7 ночей",
                  ),
                  DDimens.smallPadding.verticalBox,
                  _buildIconText(
                    context,
                    iconData: Icons.food_bank_outlined,
                    text: "Ультра всё включено",
                  ),
                  DDimens.smallPadding.verticalBox,
                  _buildIconText(
                    context,
                    iconData: Icons.bed_outlined,
                    text: "Deluxe Room",
                  ),
                ],
              ),
            ),
            DDimens.bigEmptiness.verticalBox,
            const Divider(),
            ListTile(
              tileColor: context.colors.white,
              contentPadding: DDimens.biggerPadding.horizontal,
              title: Row(
                children: [
                  Text(
                    "1 895 061 ₸",
                    style: context.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DDimens.bigPadding.horizontalBox,
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
                  ),
                ],
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right_outlined,
              ),
              subtitle: Text(
                "Осталось мало мест по этой цене",
                style: context.textTheme.bodySmallMinus!.copyWith(
                  color: context.colors.primaryRed,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildIconText(
    BuildContext context, {
    required IconData iconData,
    required String text,
  }) {
    return Row(
      children: [
        Icon(
          iconData,
          color: context.colors.gradationGrey,
        ),
        DDimens.mediumPadding.horizontalBox,
        Text(
          text,
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colors.gradationGrey,
          ),
        )
      ],
    );
  }

  SizedBox _buildEmpty(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: PrimaryImageText(
        assetName: "assets/illustration.png",
        text: "Вы пока не заказали\nни единого тура",
      ),
    );
  }
}
