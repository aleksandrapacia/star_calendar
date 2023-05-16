import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendar'), centerTitle: true),
      body: Container(
        child: TableCalendar(
            locale: "en_US",
            rowHeight: 100,
            headerStyle: const HeaderStyle(
                formatButtonVisible: false, titleCentered: true),
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2020),
            lastDay: DateTime.utc(3000)),
      ),
    );
  }
}
