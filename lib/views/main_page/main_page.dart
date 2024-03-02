import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:leyli_travel_mozz/app/router/app_router.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  final bool isBottomNavBar;
  final int currentIndex;

  const MainPage({
    Key? key,
    this.isBottomNavBar = true,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _currentIndex;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        SearchTourRoute(),
        MyTourRoute(),
        NotificationRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: widget.isBottomNavBar
              ? BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      tabsRouter.setActiveIndex(index);
                      _currentIndex = index;
                    });
                  },
                  items: _items,
                  selectedItemColor: context.colors.primaryGreen,
                  unselectedItemColor: context.colors.black,
                  showUnselectedLabels: true,
                  selectedLabelStyle: TextStyle(fontSize: 10),
                  selectedFontSize: 10,
                  unselectedFontSize: 10,
                  type: BottomNavigationBarType.fixed,
                )
              : null,
        );
      },
    );
  }

  List<BottomNavigationBarItem> get _items {
    return [
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
    ];
  }
}
