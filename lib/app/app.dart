import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:leyli_travel_mozz/app/colors/app_colors.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/app/theme/app_text_theme/app_text_theme.dart';
import 'package:leyli_travel_mozz/l10n/l10n.dart';
import 'package:leyli_travel_mozz/views/calendar.dart';
import 'package:leyli_travel_mozz/views/main_page/main_page.dart';
import 'package:leyli_travel_mozz/views/main_page/search_tour/search_tour_page.dart';

class LeyliTravelApp extends StatelessWidget {
  const LeyliTravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: appColorsLight.primaryGreen,
          ),
          useMaterial3: true,
          textTheme: AppTextTheme.lightTextTheme,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: appColorsLight.white,
            contentPadding: EdgeInsets.symmetric(
              vertical: DDimens.biggerPadding,
              horizontal: DDimens.largePadding,
            ),
            suffixStyle: TextStyle(color: appColorsLight.black),
            focusedBorder: OutlineInputBorder(
              borderRadius: DDimens.bigRadius.radius,
              borderSide: BorderSide(
                width: 1.5,
              ),
              gapPadding: DDimens.smallPadding,
            ),
            border: OutlineInputBorder(
              borderRadius: DDimens.bigRadius.radius,
              gapPadding: DDimens.smallPadding,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: DDimens.bigRadius.radius,
              borderSide: BorderSide(
                width: 1,
                color: appColorsLight.gray20,
              ),
              gapPadding: DDimens.smallPadding,
            ),
          )),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      locale: const Locale("ru"),
      home: MainPage(),
    );
  }
}
