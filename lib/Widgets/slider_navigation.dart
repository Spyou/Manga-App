import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:sliding_navbar/Pages/account_page.dart';
import 'package:sliding_navbar/Pages/home_page.dart';
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

  final Map<String, IconData> _icons = const {
    'Home': FluentIcons.home_20_filled,
    'Search': FluentIcons.search_20_filled,
    'My List': FluentIcons.bookmark_20_filled,
    'Account': FluentIcons.person_circle_20_filled,
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 18, 18, 18),
          items: _icons
              .map(
                (label, icon) => MapEntry(
                  label,
                  BottomNavigationBarItem(
                    icon: Icon(
                      icon,
                      size: 25,
                    ),
                    label: label,
                  ),
                ),
              )
              .values
              .toList(),
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
