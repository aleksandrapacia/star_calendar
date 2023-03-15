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
  void _onPageChanged(int index) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _controlPages,
          children: _screens,
          onPageChanged: _onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.notes_outlined),
              label: 'Notes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_view_day_outlined),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: 'Log in',
            ),
          ],
        ));
  }
}
