import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/core/constants/constants.dart';
import 'package:leyli_travel_mozz/core/enum/seat_status.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';
import 'package:leyli_travel_mozz/core/mocks/seats.dart';
import 'package:leyli_travel_mozz/models/seat/seat_model.dart';

class BusSeats extends StatefulWidget {
  const BusSeats({super.key});

  @override
  State<BusSeats> createState() => BusSeatsState();
}

class BusSeatsState extends State<BusSeats> {
  final List<SeatModel> _seats = kSeats;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildBusFront(),
        DDimens.largePadding.verticalBox,
        buildColumnNames(),
        // Four Seats
        ...buildSeats(),
      ],
    );
  }

  Row buildBusFront() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text(
            "Водитель",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: context.colors.gray20,
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          child: buildDoor(),
        ),
      ],
    );
  }

  Padding buildColumnNames() {
    return Padding(
      padding: DDimens.smallPadding.bottom,
      child: Row(
        children: [
          Expanded(
            child: Text(
              "A",
              textAlign: TextAlign.center,
            ),
          ),
          DDimens.bigPadding.horizontalBox,
          Expanded(
            child: Text(
              "B",
              textAlign: TextAlign.center,
            ),
          ),
          DDimens.bigPadding.horizontalBox,
          Spacer(),
          DDimens.bigPadding.horizontalBox,
          Expanded(
            child: Text(
              "C",
              textAlign: TextAlign.center,
            ),
          ),
          DDimens.bigPadding.horizontalBox,
          Expanded(
            child: Text(
              "D",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  List<SeatModel> getSublist4(int initialIndex, List<SeatModel> seats) {
    return seats.sublist(initialIndex, initialIndex + 4);
  }

  Widget build2SeatsLeft({
    required List<SeatModel> seats,
    required int initialIndex,
    required int rowIndex,
  }) {
    return Padding(
      padding: DDimens.bigPadding.bottom,
      child: Row(
        children: [
          buildSeat(initialIndex + 1),
          DDimens.bigPadding.horizontalBox,
          buildSeat(initialIndex + 2),
          DDimens.bigPadding.horizontalBox,
          Expanded(
            child: Text(
              "${rowIndex + 1}",
              style: context.textTheme.titleSmall!.copyWith(
                fontFamily: semiBold,
                color: context.colors.gray40,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          DDimens.bigPadding.horizontalBox,
          DDimens.bigPadding.horizontalBox,
          Expanded(
            flex: 2,
            child: buildDoor(),
          ),
        ],
      ),
    );
  }

  Widget build4Seats({
    required List<SeatModel> seats,
    required int initialIndex,
    required int rowIndex,
  }) {
    return Padding(
      padding: DDimens.bigPadding.bottom,
      child: Row(
        children: [
          buildSeat(
            initialIndex + 1,
          ),
          DDimens.bigPadding.horizontalBox,
          buildSeat(initialIndex + 2),
          DDimens.bigPadding.horizontalBox,
          Expanded(
            child: Text(
              "${rowIndex + 1}",
              style: context.textTheme.titleSmall!.copyWith(
                fontFamily: semiBold,
                color: context.colors.gray40,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          DDimens.bigPadding.horizontalBox,
          buildSeat(initialIndex + 3),
          DDimens.bigPadding.horizontalBox,
          buildSeat(initialIndex + 4),
        ],
      ),
    );
  }

  Widget build5Seats({
    required List<SeatModel> seats,
    required int initialIndex,
  }) {
    return Padding(
      padding: DDimens.bigPadding.bottom,
      child: Row(
        children: [
          buildSeat(initialIndex + 1),
          DDimens.bigPadding.horizontalBox,
          buildSeat(initialIndex + 2),
          DDimens.bigPadding.horizontalBox,
          buildSeat(initialIndex + 3),
          DDimens.bigPadding.horizontalBox,
          buildSeat(initialIndex + 4),
          DDimens.bigPadding.horizontalBox,
          buildSeat(initialIndex + 5),
        ],
      ),
    );
  }

  Widget buildSeat(int number) {
    final index = number - 1;
    final seat = _seats[index];
    return Expanded(
      child: GestureDetector(
        onTap: () => _selectSeatTap(index),
        child: Container(
          padding: DDimens.bigPadding.all,
          decoration: BoxDecoration(
              borderRadius: DDimens.bigRadius.radius,
              color: seat.getBackgroundColor(context),
              border: Border.all(
                color: seat.status == SeatStatus.unselected
                    ? context.colors.gray20
                    : Colors.transparent,
              )),
          child: Column(
            children: [
              Text(
                "$number",
                style: context.textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: seat.getSeatColor(context),
                ),
              ),
              SvgPicture.asset(
                "assets/svg/seat.svg",
                color: seat.getSeatColor(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildDoor() {
    return Row(
      children: [
        Transform.flip(
          flipX: true,
          child: Icon(
            Icons.arrow_right_alt_outlined,
            color: context.colors.gray20,
          ),
        ),
        DDimens.bigPadding.horizontalBox,
        Text(
          "Дверь",
          style: TextStyle(
            color: context.colors.gray20,
          ),
        ),
      ],
    );
  }

  List<Widget> buildSeats() {
    return List.generate(
      13,
      (index) {
        if (index == 0) {
          return build4Seats(
            seats: getSublist4(index, _seats),
            initialIndex: index,
            rowIndex: index,
          );
        }
        if (index < 6) {
          return build4Seats(
            seats: getSublist4(index * 4, _seats),
            initialIndex: index * 4,
            rowIndex: index,
          );
        }
        if (index == 6) {
          return build2SeatsLeft(
            seats: _seats.sublist(24, 26),
            initialIndex: 24,
            rowIndex: 6,
          );
        }
        if (12 > index && index > 6) {
          final multiply = (index - 6) * 4;
          final rowIndex = index;
          final initialIndex = 22 + multiply; // 26
          return build4Seats(
            seats: getSublist4(initialIndex, _seats),
            initialIndex: initialIndex,
            rowIndex: rowIndex,
          );
        }
        return build5Seats(
          seats: _seats.sublist(46),
          initialIndex: 46,
        );
      },
    );
  }

  _selectSeatTap(int index) {
    final seat = _seats[index];
    if (seat.status == SeatStatus.unselected) {
      setState(() {
        _seats[index] = seat.copyWith(
          status: SeatStatus.selected,
        );
      });
    }
    if (seat.status == SeatStatus.selected) {
      setState(() {
        _seats[index] = seat.copyWith(
          status: SeatStatus.unselected,
        );
      });
    }
  }
}
