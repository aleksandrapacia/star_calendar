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
                    contentPadding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    content: Column(
                      children: [
                        //Text("What did you see?"),
                        Text('What did you see?'),
                        TextField(),
                        Text("When did you see it?"),
                        TextField(),
                        Text("How did you see it?"),
                        TextField(),
                      ],
                    )));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.tealAccent,
        ),
        appBar: AppBar(
          title: const Text('Notes'),
          centerTitle: true,
        ));
  }
}
