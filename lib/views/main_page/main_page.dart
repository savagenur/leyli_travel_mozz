import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';
import 'package:leyli_travel_mozz/views/main_page/my_tour/my_tour_page.dart';
import 'package:leyli_travel_mozz/views/main_page/notification/notification_page.dart';
import 'package:leyli_travel_mozz/views/main_page/profile/profile_page.dart';
import 'package:leyli_travel_mozz/views/main_page/search_tour/search_tour_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [
    SearchTourPage(),
    MyTourPage(),
    NotificationPage(),
    ProfilePage(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) => setState(() {
          _currentIndex = value;
        }),
        selectedItemColor: context.colors.primaryGreen,
        unselectedItemColor: context.colors.black,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontSize: 10),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            
            icon: Icon(
              Icons.search,
            ),
            label: "Поиск туров",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_travel,
            ),
            label: "Мой тур",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none,
            ),
            label: "Уведомления",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_rounded,
            ),
            label: "Профиль",
          ),
        ],
      ),
    );
  }
}
