import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:sliding_navbar/Pages/Home%20Screen/home_page.dart';
import 'package:sliding_navbar/Pages/account_page.dart';
import 'package:sliding_navbar/Pages/my_list.dart';
import 'package:sliding_navbar/Pages/search_page.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final List<Widget> _screens = [
    const HomePage(),
    const SearchPage(),
    const MyList(),
    const AccountPage()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: const Color.fromARGB(255, 46, 46, 46),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 18, 18, 18),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                FluentIcons.home_20_regular,
              ),
              label: 'Home',
              tooltip: 'Home',
              activeIcon: Icon(
                FluentIcons.home_20_filled,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FluentIcons.search_20_regular,
              ),
              label: 'Search',
              tooltip: 'Search',
              activeIcon: Icon(
                FluentIcons.search_20_filled,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FluentIcons.bookmark_20_regular,
              ),
              label: 'My List',
              tooltip: 'My List',
              activeIcon: Icon(
                FluentIcons.bookmark_20_filled,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FluentIcons.person_20_regular,
              ),
              label: 'Account',
              tooltip: 'Account',
              activeIcon: Icon(
                FluentIcons.person_20_filled,
              ),
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: const Color.fromARGB(253, 255, 213, 0),
          selectedFontSize: 11,
          unselectedFontSize: 11,
          unselectedItemColor: Colors.white,
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
      body: _screens[_currentIndex],
    );
  }
}
