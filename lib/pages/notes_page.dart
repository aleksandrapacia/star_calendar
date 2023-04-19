// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_const

import 'package:flutter/material.dart';
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "whatInf",
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
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {},
                      //createNewObs;

                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                      ),
                      child: Text("Add new observation"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
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
      body: ListView.builder(itemBuilder: (context, index) {
        return ObsTile(
          whatInf: _textController.text,
          whenInf: _textController.text,
          howInf: _textController.text,
        );
      }),
      appBar: AppBar(
        title: const Text('Notes'),
        centerTitle: true,
      ),
    );
  }
}
