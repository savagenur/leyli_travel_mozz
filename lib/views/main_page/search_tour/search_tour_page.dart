import 'package:auto_route/auto_route.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/app/router/app_router.dart';
import 'package:leyli_travel_mozz/app/theme/app_text_theme/app_text_theme.dart';
import 'package:leyli_travel_mozz/core/enum/road_enum.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';
import 'package:leyli_travel_mozz/core/mocks/towns.dart';
import 'package:leyli_travel_mozz/core/widgets/button/primary_button.dart';
import 'package:leyli_travel_mozz/core/widgets/input/dropdown/primary_dropdown_form_field.dart';
import 'package:leyli_travel_mozz/core/widgets/input/text/primary_text_form_field.dart';
import 'package:leyli_travel_mozz/core/widgets/line/dashed_line.dart';
import 'package:leyli_travel_mozz/core/widgets/line/vertical_dashed_line.dart';
import 'package:leyli_travel_mozz/views/tour_list/tour_list_page.dart';

enum TravelType {
  abroad,
  aroundTheCountry;
}

@RoutePage()
class SearchTourPage extends StatefulWidget {
  const SearchTourPage({super.key});

  @override
  State<SearchTourPage> createState() => SearchTourPageState();
}

class SearchTourPageState extends State<SearchTourPage> {
  final TextEditingController _dateAbroadController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _dateDepartureATCController =
      TextEditingController();
  final TextEditingController _dateArriveATCController =
      TextEditingController();
  TravelType _travelType = TravelType.abroad;
  String? _townName;
  List<DateTime?>? _dates;
  bool get _isAbroad => _travelType == TravelType.abroad;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Remove focus from the current focus node
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: [
            const SizedBox(
              height: double.infinity,
              width: double.infinity,
            ),
            _buildBGImage(),
            _buildTabBar(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Positioned _buildBGImage() {
    return Positioned(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .55,
        child: Image.asset(
          _isAbroad ? "assets/bg_img.jpeg" : "assets/bg2.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Column(
        children: [
          _buildChatBtn(),
          Container(
            padding: DDimens.largePadding.all,
            decoration: BoxDecoration(
              color: context.colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(
                  DDimens.largeRadius,
                ),
                topLeft: Radius.circular(
                  DDimens.largeRadius,
                ),
              ),
            ),
            child: _isAbroad ? _buildAbroadFields() : _buildATCFields(),
          ),
        ],
      ),
    );
  }

  Column _buildATCFields() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DDimens.biggerPadding.verticalBox,
        _buildDepartureArriveATCDropDown(),
        DDimens.largePadding.verticalBox,
        Row(
          children: [
            Expanded(
              child: _buildDepartureDateATC(),
            ),
            DDimens.biggerPadding.horizontalBox,
            Expanded(
              child: _buildArriveDateATC(),
            ),
          ],
        ),
        DDimens.largePadding.verticalBox,
        PrimaryDropDownButton(
          labelText: "Кол-во туристов",
          value: _townName,
          items: List.generate(20, (index) {
            return DropdownMenuItem(
              value: index,
              child: Text(
                "${index + 1} взрослых",
              ),
            );
          }),
          onChanged: (value) {},
        ),
        DDimens.largePadding.verticalBox,
        PrimaryButton(
          text: "Найти туры",
          onTap: () {
            context.pushRoute(
              TourListRoute(
                title: "Анталия-Алматы",
              ),
            );
          },
          margin: DDimens.largePadding.horizontal,
        ),
        DDimens.bigPadding.verticalBox,
      ],
    );
  }

  Column _buildAbroadFields() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DDimens.biggerPadding.verticalBox,
        _buildDepartureArriveAbroadDropDown(),
        DDimens.largePadding.verticalBox,
        Row(
          children: [
            Expanded(
              flex: 4,
              child: _buildDepartureDateAbroad(),
            ),
            DDimens.biggerPadding.horizontalBox,
            Expanded(
              flex: 3,
              child: _buildDays(),
            ),
          ],
        ),
        DDimens.largePadding.verticalBox,
        PrimaryDropDownButton(
          labelText: "Кол-во туристов",
          value: _townName,
          items: List.generate(20, (index) {
            return DropdownMenuItem(
              value: index,
              child: Text(
                "${index + 1} взрослых",
              ),
            );
          }),
          onChanged: (value) {},
        ),
        DDimens.largePadding.verticalBox,
        PrimaryButton(
          text: "Найти туры",
          onTap: () {
            context.pushRoute(
              TourListRoute(
                title: "Анталия-Алматы",
              ),
            );
          },
          margin: DDimens.largePadding.horizontal,
        ),
        DDimens.bigPadding.verticalBox,
      ],
    );
  }

  Container _buildChatBtn() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(
        right: DDimens.biggerPadding,
        bottom: DDimens.biggerPadding,
      ),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            backgroundColor: context.colors.primaryGreen,
            foregroundColor: context.colors.white,
            textStyle: context.textTheme.bodySmall),
        onPressed: () {},
        icon: Icon(Icons.chat_bubble_outline_sharp),
        label: Text(
          "Чат с поддержкой",
        ),
      ),
    );
  }

  int rangeDayCalculate() {
    return _dates!.last!.difference(_dates!.first!).inDays;
  }

  PrimaryTextFormField _buildDays() {
    return PrimaryTextFormField(
      controller: _dayController,
      onTap: () {},
      readOnly: true,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelText: "Ночей",
      suffixIcon: Icon(
        Icons.access_time_outlined,
      ),
    );
  }

  PrimaryTextFormField _buildDepartureDateAbroad() {
    return PrimaryTextFormField(
      onTap: () async {
        _dates = await _calendarDialog(context);
        setState(() {
          if (_dates != null && _dates!.isNotEmpty) {
            var startDate = DateFormat("dd.MM").format(_dates!.first!);
            switch (_dates!.length) {
              case 1:
                _dateAbroadController.text = startDate;
                _dayController.text = "";
                break;
              case 2:
                var endDate = DateFormat("dd.MM").format(_dates!.last!);
                _dateAbroadController.text = "$startDate - $endDate";
                _dayController.text =
                    "${rangeDayCalculate()} - ${rangeDayCalculate() + 1}";
                break;
              default:
            }
          }
        });
      },
      controller: _dateAbroadController,
      labelText: "Даты вылета",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      readOnly: true,
      suffixIcon: Icon(
        Icons.calendar_month,
      ),
    );
  }

  PrimaryTextFormField _buildDepartureDateATC() {
    return PrimaryTextFormField(
      onTap: () async {
        final dates = await _calendarDialog(context);
        if (dates != null) {
          var dateString = DateFormat("dd.MM").format(dates.first!);
          _dateDepartureATCController.text = dateString;
        }
      },
      controller: _dateDepartureATCController,
      labelText: "Туда",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      readOnly: true,
      suffixIcon: const Icon(
        Icons.calendar_month,
      ),
    );
  }

  PrimaryTextFormField _buildArriveDateATC() {
    return PrimaryTextFormField(
      onTap: () async {
        final dates = await _calendarDialog(context);
        if (dates != null) {
          var dateString = DateFormat("dd.MM").format(dates.first!);
          _dateArriveATCController.text = dateString;
        }
      },
      controller: _dateArriveATCController,
      labelText: "Обратно",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      readOnly: true,
      suffixIcon: const Icon(
        Icons.calendar_month,
      ),
    );
  }

  Row _buildDepartureArriveATCDropDown() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              PrimaryDropDownButton(
                labelText: "Откуда",
                value: _townName,
                items: kTowns
                    .map(
                      (town) => DropdownMenuItem(
                        value: town.name,
                        child: Text(
                          town.name!,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {},
              ),
              DDimens.largePadding.verticalBox,
              PrimaryDropDownButton(
                labelText: "Куда",
                value: _townName,
                items: kTowns
                    .map(
                      (town) => DropdownMenuItem(
                        value: town.name,
                        child: Text(
                          town.name!,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        DDimens.largePadding.horizontalBox,
        _buildFromToLocationIcons(),
      ],
    );
  }

  Row _buildDepartureArriveAbroadDropDown() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              PrimaryDropDownButton(
                labelText: "Город вылета",
                value: _townName,
                items: kTowns
                    .map(
                      (town) => DropdownMenuItem(
                        value: town.name,
                        child: Text(
                          town.name!,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {},
              ),
              DDimens.largePadding.verticalBox,
              PrimaryDropDownButton(
                labelText: "Страна, курорт, отель",
                value: _townName,
                items: kTowns
                    .map(
                      (town) => DropdownMenuItem(
                        value: town.name,
                        child: Text(
                          town.name!,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        DDimens.largePadding.horizontalBox,
        _buildFromToLocationIcons(),
      ],
    );
  }

  Column _buildFromToLocationIcons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.location_on_outlined,
          color: context.colors.primaryGreen,
        ),
        Padding(
          padding: DDimens.smallPadding.vertical,
          child: VerticalDashedLine(
            height: 40.0,
            color: context.colors.primaryGreen,
            dashHeight: 5.0,
            dashSpace: 4.0,
          ),
        ),
        Icon(
          Icons.location_on_outlined,
          color: context.colors.primaryGreen,
        ),
      ],
    );
  }

  Future<List<DateTime?>?> _calendarDialog(BuildContext context) {
    return showCalendarDatePicker2Dialog(
      context: context,
      value: [DateTime.now()],
      config: CalendarDatePicker2WithActionButtonsConfig(
        firstDayOfWeek: 1,

        calendarType: _isAbroad
            ? CalendarDatePicker2Type.range
            : CalendarDatePicker2Type.single,
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
                    style: TextStyle(color: context.colors.white, height: 0),
                  ),
                  Text(
                    "213 434",
                    style: context.textTheme.bodySmallMinus!
                        .copyWith(color: context.colors.white, height: 0),
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
                style: context.textTheme.bodySmallMinus!,
              ),
            ],
          );
        },
        // yearBuilder: _yourYearBuilder,
      ),
      dialogSize: Size(
        6000,
        400,
      ),
    );
  }

  Widget _buildTabBar() {
    return Positioned(
      top: DDimens.doubleHugePadding,
      right: DDimens.largePadding,
      left: DDimens.largePadding,
      child: Container(
        height: DDimens.searchTourTabBarHeight,
        padding: DDimens.smallPadding.all,
        decoration: BoxDecoration(
          borderRadius: DDimens.circleRadius.radius,
          color: context.colors.black40,
        ),
        child: Row(
          children: [
            _buildTab(
              title: "За границу",
              onTap: () {
                setState(() {
                  _travelType = TravelType.abroad;
                });
              },
              isSelected: _travelType == TravelType.abroad,
            ),
            _buildTab(
              title: "По стране",
              onTap: () {
                setState(() {
                  _travelType = TravelType.aroundTheCountry;
                });
              },
              isSelected: _travelType == TravelType.aroundTheCountry,
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildTab(
      {required String title,
      required VoidCallback onTap,
      required bool isSelected}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: DDimens.circleRadius.radius,
            color: isSelected ? context.colors.white : Colors.transparent,
          ),
          child: Text(
            title,
            style: context.textTheme.titleSmall!.copyWith(
              color: isSelected ? context.colors.black : Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
