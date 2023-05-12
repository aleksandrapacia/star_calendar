import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  void _showDatePicker(BuildContext context) {
    showCrDatePicker(
      context,
      properties: DatePickerProperties(
        firstWeekDay: WeekDay.monday,
        okButtonBuilder: (onPress) =>
            ElevatedButton(child: const Text('OK'), onPressed: () => {}),
        cancelButtonBuilder: (onPress) =>
            OutlinedButton(child: const Text('CANCEL'), onPressed: () => {}),
        initialPickerDate: DateTime.now(),
        onDateRangeSelected: (DateTime? rangeBegin, DateTime? rangeEnd) {},
      ),
    );
  }

  final CrCalendarController _controller = CrCalendarController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Calendar'), centerTitle: true),
        body: CrCalendar(
          initialDate: DateTime.now(),
          controller: _controller,
          backgroundColor: Colors.tealAccent,
        ));
  }
}
