import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/app/theme/app_text_theme/app_text_theme.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';
import 'package:leyli_travel_mozz/core/widgets/appbar/adaptive_app_bar.dart';
import 'package:leyli_travel_mozz/core/widgets/primary_image_text.dart';

@RoutePage()
class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => NotificationPageState();
}

class NotificationPageState extends State<NotificationPage> {
  bool _isNotification = true;
  bool _isEmptyPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(
        text: "Уведомления",
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message_outlined,
              )),
        ],
      ),
      body: Column(
        children: [
          Padding(
              padding: DDimens.largePadding.all,
            // color: context.colors.scaffoldBackground,
            child: ListTile(
                title: Text("Отключить уведомления"),
                tileColor: context.colors.gray80,
                trailing: Switch(
                  value: _isNotification,
                  onChanged: (value) => setState(
                    () => _isNotification = value,
                  ),
                ),
              ),
          ),
          Expanded(
            flex: 3,
            child: _isEmptyPage
                ? _buildEmptyText()
                : ListView.builder(
                    padding: DDimens.largePadding.horizontal,
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: DDimens.largePadding.bottom,
                        child: Card(
                          elevation: 0,
                          child: ListTile(
                            title: Row(
                              children: [
                                Icon(
                                  Icons.notifications_none,
                                  color: context.colors.gray20,
                                ),
                                DDimens.smallPadding.horizontalBox,
                                Text(
                                  "День рождения!",
                                  style: context.textTheme.bodyMedium!.copyWith(
                                    color: context.colors.gray20,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              """Нашей компании испольняется 10 лет! в честь этого мы дарим вам скидку на любые туры в 50% по промокоду R24ED1""",
                              
                              style: context.textTheme.bodyMediumMinus!.copyWith(
                                color: context.colors.black,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          if (_isEmptyPage) const Spacer(),
        ],
      ),
    );
  }

  Widget _buildEmptyText() {
    return PrimaryImageText(
      assetName: "assets/illustration (1).png",
      text: "Увемлений\nпока нет",
    );
  }
}
