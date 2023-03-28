// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:star_calendar/pages/calendar_page.dart';
import 'package:star_calendar/pages/login_page.dart';
import 'package:star_calendar/pages/notes_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _controlPages = PageController();
  List<Widget> _screens = [NotesPage(), CalendarPage(), LoginPage()];
  int selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _controlPages.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controlPages,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          // index = 0
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notes_outlined,
              color: selectedIndex == 0 ? Colors.blue : Colors.grey,
            ),
            label: 'Notes',
          ),
          // index = 1
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_view_day_outlined,
              color: selectedIndex == 1 ? Colors.blue : Colors.grey,
            ),
            label: 'Calendar',
          ),
          // index = 2
          BottomNavigationBarItem(
            icon: Icon(
              Icons.login,
              color: selectedIndex == 2 ? Colors.blue : Colors.grey,
            ),
            label: 'Log in',
          ),
        ],
        selectedItemColor: Color.fromARGB(255, 166, 0, 255),
        onTap: _onItemTapped,
        currentIndex: selectedIndex,
      ),
    );
  }
}
