import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:leyli_travel_mozz/app/colors/app_colors.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/app/router/app_router.dart';
import 'package:leyli_travel_mozz/app/theme/app_text_theme/app_text_theme.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';
import 'package:leyli_travel_mozz/injection_container.dart';
import 'package:leyli_travel_mozz/l10n/l10n.dart';

class LeyliTravelApp extends StatelessWidget {
  const LeyliTravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(context),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      locale: const Locale("ru"),
    );
  }

  ThemeData theme(BuildContext context) {
    return ThemeData(
        fontFamily: "Gilroy",
        colorScheme: ColorScheme.fromSeed(
          seedColor: appColorsLight.primaryGreen,
        ),
        useMaterial3: true,
        textTheme: AppTextTheme.lightTextTheme,
        listTileTheme: ListTileThemeData(
          contentPadding: DDimens.biggerPadding.horizontal,
          tileColor: context.colors.gray80,
          shape: OutlineInputBorder(
            borderRadius: DDimens.bigRadius.radius,
            borderSide: BorderSide.none,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: appColorsLight.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: DDimens.biggerPadding,
            horizontal: DDimens.largePadding,
          ),
          suffixStyle: TextStyle(color: appColorsLight.black),
          focusedBorder: OutlineInputBorder(
            borderRadius: DDimens.bigRadius.radius,
            borderSide: BorderSide(
              width: 1.5,
              color: appColorsLight.primaryGreen,
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
        ));
  }
}
