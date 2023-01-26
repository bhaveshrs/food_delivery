import 'package:flutter/material.dart';
import 'package:food_delivery/screens/secondhome_screen.dart';

import 'account_screen.dart';
import 'favorite_screen.dart';
import 'notification_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  List screens = [
    const MainHomePage(),
    const FavoriteFoodPage(),
    const NotificationScreen(),
    const AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none), label: 'notification'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'account'),
        ],
        currentIndex: _index,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
