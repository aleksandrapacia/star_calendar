// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_const

import 'package:flutter/material.dart';
import 'package:star_calendar/util/dialog_box.dart';
import 'package:star_calendar/util/obs_tile.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // text controller
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _secondTextController = TextEditingController();
  final TextEditingController _secondTimeController = TextEditingController();
  final TextEditingController _thirdTextController = TextEditingController();
  List obsList = [
    //  0       1         2        3           4
  ];

  void deleteTask(int index) {
    setState(() {
      obsList.removeAt(index);
    });
  }

  // saving new task
  void saveObs() {
    setState(
      () {
        obsList.add(
          [
            _textController.text,
            _secondTextController.text,
            _secondTimeController.text,
            _thirdTextController.text,
            false
          ],
        );

        [
          _textController.clear(),
          _secondTextController.clear(),
          _secondTimeController.clear(),
          _thirdTextController.clear()
        ];
        Navigator.of(context).pop();
      },
    );
  }

  void _onFabTap(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return DialogBox(
          onSave: saveObs,
          onCancel: () => [
            _textController.clear(),
            _secondTextController.clear(),
            _thirdTextController.clear(),
            Navigator.of(context).pop()
          ],
          textController: _textController,
          secondTextController: _secondTextController,
          secondTimeController: _secondTimeController,
          thirdTextController: _thirdTextController,
        );
      },
    );
  }

  @override
  //TODO: coś tutaj z context????
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
      body: ListView.builder(
        itemCount: obsList.length,
        //shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ObsTile(
            whatInf: obsList[index][0],
            whenInf: obsList[index][1],
            whenTimeInf: obsList[index][2],
            howInf: obsList[index][3],
            observSeen: obsList[index][4],
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
