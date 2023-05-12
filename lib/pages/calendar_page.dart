import 'package:cr_calendar/src/cr_calendar.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final CrCalendarController _controller = CrCalendarController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Calendar'), centerTitle: true),
        body: CrCalendar(
          initialDate: DateTime.now(),
          controller: _controller,
        ));
  }
}
