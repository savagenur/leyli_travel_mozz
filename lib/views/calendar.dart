import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/app/theme/app_text_theme/app_text_theme.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<DateTime?> _dates = [];
    return Scaffold(
      body: SafeArea(
        child: CalendarDatePicker2(
          config: CalendarDatePicker2WithActionButtonsConfig(
            firstDayOfWeek: 1,
            calendarType: CalendarDatePicker2Type.range,
            selectedDayTextStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            selectedDayHighlightColor: context.colors.primaryGreen,
            centerAlignModePicker: true,
            customModePickerIcon: SizedBox(),

            dayBuilder: ({
              required date,
              decoration,
              isDisabled,
              isSelected,
              isToday,
              textStyle,
            }) {
              if ((isToday ?? false) && !isSelected!) {
                return Container(
                  padding: DDimens.tinyPadding.horizontal,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.colors.secondaryGreen,
                    ),
                    borderRadius: DDimens.bigRadius.radius,
                  ),
                  child: Column(
                    children: [
                      Text(
                        DateFormat.d().format(
                          date,
                        ),
                        style: TextStyle(
                          color: context.colors.black,
                        ),
                      ),
                      Text(
                        "213 434",
                        style: context.textTheme.bodySmallMinus!.copyWith(
                          color: context.colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              }
              if ((isSelected ?? false) || (isToday ?? false)) {
                return Container(
                  padding: DDimens.tinyPadding.horizontal,
                  decoration: BoxDecoration(
                    color: context.colors.secondaryGreen,
                    borderRadius: DDimens.bigRadius.radius,
                  ),
                  child: Column(
                    children: [
                      Text(
                        DateFormat.d().format(
                          date,
                        ),
                        style: TextStyle(
                          color: context.colors.white,
                        ),
                      ),
                      Text(
                        "213 434",
                        style: context.textTheme.bodySmallMinus!.copyWith(
                          color: context.colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Column(
                children: [
                  Text(
                    DateFormat.d().format(
                      date,
                    ),
                  ),
                  Text(
                    "213 434",
                    style: context.textTheme.bodySmallMinus,
                  ),
                ],
              );
            },
            // yearBuilder: _yourYearBuilder,
          ),
          onValueChanged: (dates) {
            _dates = dates;
            print(dates.length);
          },
          value: [DateTime.now()],
        ),
      ),
    );
  }
}
