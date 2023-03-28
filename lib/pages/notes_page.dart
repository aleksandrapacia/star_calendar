// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

//TODO: create data base for each text field and store it
//TODO: how to store it?
class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                    title: Center(child: Text('Form')),
                    content: Column(
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Text("What did you see?"),
                        Padding(padding: EdgeInsets.all(10)),
                        TextField(),
                        Padding(padding: EdgeInsets.all(10)),
                        Text("When did you see it?"),
                        Padding(padding: EdgeInsets.all(10)),
                        TextField(),
                        Padding(padding: EdgeInsets.all(10)),
                        Text("How did you see it?"),
                        Padding(padding: EdgeInsets.all(10)),
                        TextField(),
                      ],
                    )));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Notes'),
          centerTitle: true,
        ));
  }
}
