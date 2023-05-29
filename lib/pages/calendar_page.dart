import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//getting selected date as String => Text("Selected Day = " + today.ToString().split(" ")[])
class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  //final _onFabTap onfabtap;
  final titleController = TextEditingController();
  // other controllers
  DateTime today = DateTime.now();
  void _onDaySelelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      //_saveObs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingActionButton(onPressed: null),
      appBar: AppBar(title: const Text('Calendar'), centerTitle: true),
      body: Container(
        child: TableCalendar(
          locale: "en_US",
          rowHeight: 90,
          headerStyle: const HeaderStyle(
              formatButtonVisible: false, titleCentered: true),
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2020),
          lastDay: DateTime.utc(3000),
          onDaySelected: _onDaySelelected,
          selectedDayPredicate: (day) => isSameDay(day, today),
          availableGestures: AvailableGestures.all,
        ),
      ),
    );
  }
}
