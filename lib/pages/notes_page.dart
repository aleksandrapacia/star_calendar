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
  final _textController = TextEditingController();
  final _secondTextController = TextEditingController();
  final _thirdTextController = TextEditingController();
  // list of items it a tile
  // ????
  List obsList = [
    //  0       1         2        3
    ["Hello", "Hi", "What is up", false]
  ];

  // saving new task
  void saveObs() {
    setState(
      () {
        obsList.add(
          [
            _textController,
            _secondTextController,
            _thirdTextController,
          ],
        );
        _textController.clear();
      },
    );
  }

  void obsSeen(bool? value, int index) {
    setState(() {
      obsList[index][1] = !obsList[index][1];
    });
  }

  void _onFabTap(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          textController: _textController,
          secondTextController: _secondTextController,
          thirdTextController: _thirdTextController,
          onSave: saveObs,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
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
      body: ListView.builder(
        itemCount: obsList.length,
        //shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ObsTile(
            // 26:25
            whatInf: obsList[index][0],
            whenInf: obsList[index][1],
            howInf: obsList[index][2],
            observSeen: obsList[index][3],
            onChanged: (value) => obsSeen,
          );
        },
      ),
    );
  }
}
