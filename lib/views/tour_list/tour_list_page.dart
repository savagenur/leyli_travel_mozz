import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/core/widgets/appbar/adaptive_app_bar.dart';
import 'package:leyli_travel_mozz/views/tour_list/widgets/tour_card.dart';

class TourListPage extends StatefulWidget {
  const TourListPage({super.key});

  @override
  State<TourListPage> createState() => _TourListPageState();
}

class _TourListPageState extends State<TourListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(
        text: "Алматы - Турция",
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
          return TourCard();
        },
      ),
    );
  }

}
