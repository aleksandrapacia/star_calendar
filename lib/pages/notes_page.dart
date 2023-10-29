// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_const

import 'package:flutter/material.dart';
import 'package:star_calendar/util/dialog_box.dart';
import 'package:star_calendar/util/obs_tile.dart';
import 'package:star_calendar/util/user_simple_prefs.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Observation>? observations;

  void _onFabTap(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return DialogBox(
          onSave: () {},
          onCancel: () => [Navigator.of(context).pop()],
        );
      },
    );
  }

  @override
  void initState() {
    UserSimplePreferences.getInstance().getObservations().then((value) {
      setState(() {
        observations = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onFabTap(context),
        backgroundColor: Colors.tealAccent,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Notes'),
        centerTitle: true,
      ),
      body: observations == null
          ? Center(child: Text('Loading ...'))
          : ListView.builder(
              itemCount: observations!.length,
              //shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final observation = observations![index];

                final date =
                    '${observation.datetime.year} ${observation.datetime.month} ${observation.datetime.day}';
                final time =
                    '${observation.datetime.hour} ${observation.datetime.minute}';

                return ObservationTile(
                    name: observation.name,
                    date: date,
                    time: time,
                    equipment: observation.equipment,
                    onDelete: () {
                      // TODO
                    });
              },
            ),
    );
  }
}
