// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ObservationTile extends StatelessWidget {
  final String name;
  final String date;
  final String time;
  final String equipment;
  final void Function() onDelete;

  const ObservationTile({
    super.key,
    required this.name,
    required this.date,
    required this.time,
    required this.equipment,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
                onPressed: (context) {
                  onDelete();
                },
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(5),
                backgroundColor: Colors.red.shade300),
          ],
        ),
        child: Container(
          width: 1000,
          decoration: BoxDecoration(
            color: Colors.tealAccent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(date),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(time),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(equipment),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
