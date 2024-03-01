import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/core/constants/constants.dart';
import 'package:leyli_travel_mozz/core/converters/app_converter.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';

class FlightTile extends StatelessWidget {
  final String companyName;
  final String leftTownCode;
  final String leftTownName;
  final TimeOfDay leftTime;
  final DateTime leftDate;
  final String rightTownCode;
  final String rightTownName;
  final TimeOfDay rightTime;
  final DateTime rightDate;
  final String durationTime;
  final String? companyImage;
  final int? baggage;
  final int? handBaggage;
  final bool reverse;
  const FlightTile({
    super.key,
    required this.companyName,
    required this.companyImage,
    required this.baggage,
    required this.handBaggage,
    required this.leftTownCode,
    required this.leftTownName,
    required this.leftTime,
    required this.leftDate,
    required this.rightTownCode,
    required this.rightTownName,
    required this.rightTime,
    required this.rightDate,
    required this.durationTime,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildFlightTile(
          context,
        ),
        DDimens.bigPadding.verticalBox,
        Padding(
          padding: DDimens.biggerPadding.horizontal,
          child: Column(
            children: [
              buildTownCode(context),
              buildTownName(context),
              buildTime(context),
              buildDate(context)
            ],
          ),
        ),
      ],
    );
  }

  Row buildDate(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            DateFormat("MM MMM").format(leftDate),
            style: context.textTheme.bodyMedium!.copyWith(
              color: context.colors.gray20,
            ),
          ),
        ),
        Text(
          "$durationTime в пути\nбез пересадок",
          textAlign: TextAlign.center,
          style: context.textTheme.bodySmall!.copyWith(
            color: context.colors.gray20,
          ),
        ),
        Expanded(
          child: Text(
            DateFormat("MM MMM").format(rightDate),
            textAlign: TextAlign.end,
            style: context.textTheme.bodyMedium!.copyWith(
              color: context.colors.gray20,
            ),
          ),
        ),
      ],
    );
  }

  Row buildTime(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            AppConverter.fromTimeOfDay(leftTime),
            style: context.textTheme.titleLarge!.copyWith(
              fontFamily: gilroyBold,
            ),
          ),
        ),
        Expanded(
          child: Text(
            AppConverter.fromTimeOfDay(rightTime),
            textAlign: TextAlign.end,
            style: context.textTheme.titleLarge!.copyWith(
              fontFamily: gilroyBold,
            ),
          ),
        ),
      ],
    );
  }

  Row buildTownName(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              Text(
                leftTownName,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colors.gray20,
                ),
              ),
              Expanded(
                  child: Divider(
                indent: DDimens.biggerPadding,
                endIndent: DDimens.biggerPadding,
              )),
            ],
          ),
        ),
        Transform.flip(
          flipX: reverse,
          child: Icon(
            Icons.flight_takeoff_rounded,
            color: context.colors.gray20,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: Divider(
                indent: DDimens.biggerPadding,
                endIndent: DDimens.biggerPadding,
              )),
              Text(
                rightTownName,
                textAlign: TextAlign.end,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colors.gray20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildTownCode(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            leftTownCode,
            style: context.textTheme.titleLarge!.copyWith(
              fontFamily: gilroyBold,
            ),
          ),
        ),
        Text(
          reverse ? "Обратно" : "Туда",
          style: context.textTheme.bodySmall!.copyWith(
            color: context.colors.gray20,
          ),
        ),
        Expanded(
          child: Text(
            rightTownCode,
            textAlign: TextAlign.end,
            style: context.textTheme.titleLarge!.copyWith(
              fontFamily: gilroyBold,
            ),
          ),
        ),
      ],
    );
  }

  ListTile buildFlightTile(
    BuildContext context,
  ) {
    final bool isHandBaggage = handBaggage != null;
    final bool isImage = companyImage != null;
    return ListTile(
      titleTextStyle: context.textTheme.titleMedium!.copyWith(
        fontFamily: gilroyBold,
      ),
      contentPadding: DDimens.bigPadding.horizontal,
      horizontalTitleGap: DDimens.bigPadding,
      leading: CircleAvatar(
        foregroundImage: isImage ? AssetImage(companyImage!) : null,
        child: const Icon(Icons.image),
      ),
      title: Text(companyName),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.luggage_outlined,
            color: context.colors.gray20,
          ),
          DDimens.mediumPadding.horizontalBox,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Багаж $baggage кг"),
              if (isHandBaggage) Text("Ручная $handBaggage кг"),
            ],
          ),
        ],
      ),
    );
  }
}
