import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/app/router/app_router.dart';
import 'package:leyli_travel_mozz/core/enum/road_enum.dart';
import 'package:leyli_travel_mozz/core/widgets/appbar/adaptive_app_bar.dart';
import 'package:leyli_travel_mozz/views/tour_list/widgets/tour_card.dart';

@RoutePage()
class TourListPage extends StatefulWidget {
  final String title;
  const TourListPage({super.key, required this.title});

  @override
  State<TourListPage> createState() => _TourListPageState();
}

class _TourListPageState extends State<TourListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(
        text: widget.title,
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
        itemCount: 5,
        padding: DDimens.biggerPadding.all,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                context.pushRoute(
                  TourInfoRoute(),
                );
              },
              child: TourCard());
        },
      ),
    );
  }
}
