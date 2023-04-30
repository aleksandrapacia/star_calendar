// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_const

import 'package:flutter/material.dart';
import 'package:star_calendar/util/dialog_box.dart';
import 'package:star_calendar/util/obs_tile.dart';

//TODO: create data base for each text field and store it
//TODO: how to store it?
class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // text controller
  final textController = TextEditingController();
  // list of items it a tile
  List obsList = [
    ["Venus", "Today", "Telescope"],
  ];

  final _textController = TextEditingController();
  void _onFabTap(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(textController: textController);
        });
  }

  // 11:08
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
          itemBuilder: (context, index) {
            return ObsTile(
              whatInf: obsList[index][0],
              whenInf: obsList[index][1],
              howInf: obsList[index][2],
            );
          }),
    );
  }
}
