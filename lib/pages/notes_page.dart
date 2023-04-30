// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_const

import 'package:flutter/material.dart';
import 'package:star_calendar/util/button.dart';
import 'package:star_calendar/util/obs_tile.dart';

//TODO: create data base for each text field and store it
//TODO: how to store it?
class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  //bool isVisible = false;
  List obsList = [
    ["Venus", "Today", "Telescope"],
  ];

  final _textController = TextEditingController();
  void _onFabTap(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(child: Text('Form')),
        contentPadding: EdgeInsets.all(30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        content: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "What did you see?",
                          suffixIcon: IconButton(
                              onPressed: () {
                                _textController.clear();
                              },
                              icon: const Icon(Icons.clear))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'When did you see it?',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'How did you see it?',
                      ),
                    ),
                  ),
                  // button 1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // button add
                      MyButton(text: "Save", onPressed: () {}),
                      // space
                      const SizedBox(width: 40),
                      // button cancel
                      MyButton(text: "Cancel", onPressed: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
