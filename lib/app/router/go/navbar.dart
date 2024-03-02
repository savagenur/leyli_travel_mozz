// import 'package:flutter/material.dart';
// 
// import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';
// import 'package:leyli_travel_mozz/views/main_page/my_tour/my_tour_page.dart';
// import 'package:leyli_travel_mozz/views/main_page/notification/notification_page.dart';
// import 'package:leyli_travel_mozz/views/main_page/profile/profile_page.dart';
// import 'package:leyli_travel_mozz/views/main_page/search_tour/search_tour_page.dart';



// /// Builds the "shell" for the app by building a Scaffold with a
// /// BottomNavigationBar, where [child] is placed in the body of the Scaffold.
// class MainPage extends StatelessWidget {
//   /// Constructs an [ScaffoldWithNavBar].
//   const MainPage({
//     required this.navigationShell,
//     Key? key,
//   }) : super(key: key ?? const ValueKey<String>('MainPage'));

//   /// The navigation shell and container for the branch Navigators.
//   final StatefulNavigationShell navigationShell;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: navigationShell,
//       bottomNavigationBar: BottomNavigationBar(
//         // Here, the items of BottomNavigationBar are hard coded. In a real
//         // world scenario, the items would most likely be generated from the
//         // branches of the shell route, which can be fetched using
//         // `navigationShell.route.branches`.
//         selectedItemColor: context.colors.primaryGreen,
//         unselectedItemColor: context.colors.black,
//         showUnselectedLabels: true,
//         selectedLabelStyle: TextStyle(fontSize: 10),
//         selectedFontSize: 10,
//         unselectedFontSize: 10,
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.search,
//             ),
//             label: "Поиск туров",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.card_travel,
//             ),
//             label: "Мой тур",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.notifications_none,
//             ),
//             label: "Уведомления",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.person_outline_rounded,
//             ),
//             label: "Профиль",
//           ),
//         ],
//         currentIndex: navigationShell.currentIndex,
//         onTap: (int index) => _onTap(context, index),
//       ),
//     );
//   }

//   /// Navigate to the current location of the branch at the provided index when
//   /// tapping an item in the BottomNavigationBar.
//   void _onTap(BuildContext context, int index) {
//     // When navigating to a new branch, it's recommended to use the goBranch
//     // method, as doing so makes sure the last navigation state of the
//     // Navigator for the branch is restored.
//     navigationShell.goBranch(
//       index,
//       // A common pattern when using bottom navigation bars is to support
//       // navigating to the initial location when tapping the item that is
//       // already active. This example demonstrates how to support this behavior,
//       // using the initialLocation parameter of goBranch.
//       initialLocation: index == navigationShell.currentIndex,
//     );
//   }
// }
