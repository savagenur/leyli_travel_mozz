import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/core/enum/road_enum.dart';
import 'package:leyli_travel_mozz/views/choose_seat/choose_seat_page.dart';
import 'package:leyli_travel_mozz/views/connect_with_us/connect_with_us_page.dart';
import 'package:leyli_travel_mozz/views/main_page/main_page.dart';
import 'package:leyli_travel_mozz/views/main_page/my_tour/my_tour_page.dart';
import 'package:leyli_travel_mozz/views/main_page/notification/notification_page.dart';
import 'package:leyli_travel_mozz/views/main_page/profile/profile_page.dart';
import 'package:leyli_travel_mozz/views/main_page/search_tour/search_tour_page.dart';
import 'package:leyli_travel_mozz/views/payment/payment_page.dart';
import 'package:leyli_travel_mozz/views/root/root_page.dart';
import 'package:leyli_travel_mozz/views/sign_in/sign_in_page.dart';
import 'package:leyli_travel_mozz/views/tour_detail/tour_detail_page.dart';
import 'package:leyli_travel_mozz/views/tour_info/tour_info_page.dart';
import 'package:leyli_travel_mozz/views/tour_list/tour_list_page.dart';
import 'package:leyli_travel_mozz/views/tour_registration/tour_registration_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: RoadEnum.root.path,
          page: RootRoute.page,
          children: [
            // RedirectRoute(path: "", redirectTo: RoadEnum.main.path),
            AutoRoute(
              // path: RoadEnum.main.path,
              path: "",
              page: MainRoute.page,
              children: [
                RedirectRoute(path: "", redirectTo: RoadEnum.searchTour.path),
                AutoRoute(
                  path: RoadEnum.searchTour.path,
                  page: SearchTourRoute.page,
                ),
                AutoRoute(
                  path: RoadEnum.myTour.path,
                  page: MyTourRoute.page,
                ),
                AutoRoute(
                  path: RoadEnum.notification.path,
                  page: NotificationRoute.page,
                ),
                AutoRoute(
                  path: RoadEnum.profile.path,
                  page: ProfileRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: RoadEnum.tourList.path,
              page: TourListRoute.page,
            ),
            AutoRoute(
              path: RoadEnum.tourInfo.path,
              page: TourInfoRoute.page,
            ),
            AutoRoute(
              path: RoadEnum.tourDetail.path,
              page: TourDetailRoute.page,
            ),
            AutoRoute(
              path: RoadEnum.tourRegistration.path,
              page: TourRegistrationRoute.page,
            ),
            AutoRoute(
              path: RoadEnum.chooseSeat.path,
              page: ChooseSeatRoute.page,
            ),
            AutoRoute(
              path: RoadEnum.payment.path,
              page: PaymentRoute.page,
            ),
            AutoRoute(
              path: RoadEnum.signIn.path,
              page: SignInRoute.page,
            ),
            AutoRoute(
              path: RoadEnum.connectWithUs.path,
              page: ConnectWithUsRoute.page,
            ),
            
          ],
        ),
      ];
}
