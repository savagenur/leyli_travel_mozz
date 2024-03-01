import 'package:flutter/material.dart';

import 'package:leyli_travel_mozz/core/enum/seat_status.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';

class SeatModel {
  final SeatStatus status;

  SeatModel({required this.status});

  Color getBackgroundColor(BuildContext context) {
    switch (status) {
      case SeatStatus.unselected:
        return context.colors.white;
      case SeatStatus.selected:
        return context.colors.primaryBlue;
      case SeatStatus.paid:
        return context.colors.primaryYellow;
      case SeatStatus.occupied:
        return context.colors.primaryGreen;
      default:
        return context.colors.white;
    }
  }

  Color getSeatColor(BuildContext context) {
    switch (status) {
      case SeatStatus.unselected:
        return context.colors.gray20;
      // case SeatStatus.selected:
      //   return context.colors.white;
      // case SeatStatus.paid:
      //   return context.colors.white;
      // case SeatStatus.occupied:
      //   return context.colors.white;
      default:
        return context.colors.white;
    }
  }

  SeatModel copyWith({
    SeatStatus? status,
  }) {
    return SeatModel(
      status: status ?? this.status,
    );
  }
}
