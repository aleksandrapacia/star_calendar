import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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
          child: SfCalendar(
        view: CalendarView.month,
        monthViewSettings: const MonthViewSettings(showAgenda: true),
      )),
    );
  }
}
